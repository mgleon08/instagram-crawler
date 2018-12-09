module InstagramCrawler
  module Parser
    class Html < Base
      attr_reader :html

      def initialize(url)
        @html = get_html(url)
      end

      def parsing
        doc       = Nokogiri::HTML(html)
        js_data   = doc.at_xpath("//script[contains(text(),'window._sharedData')]")
        json      = JSON.parse(js_data.text[21..-2])
        profile   = json["entry_data"]["ProfilePage"][0]
        page_info = profile["graphql"]["user"]["edge_owner_to_timeline_media"]['page_info']
        user_id   = profile["logging_page_id"].delete("profilePage_")
        edges     = profile["graphql"]["user"]["edge_owner_to_timeline_media"]["edges"]

        loop_edges(edges)

        return page_info, user_id
      end

      def parsing_video_page
        doc    = Nokogiri::HTML(html)
        meta_v = doc.at_xpath("//meta[@property='og:video']")
        url    = meta_v.attribute_nodes.last.value
      end

      def parsing_photo_page
        doc       = Nokogiri::HTML(html)
        js_data   = doc.at_xpath("//script[contains(text(),'window._sharedData')]")
        json      = JSON.parse(js_data.text[21..-2])
        shortcode_media = json["entry_data"]["PostPage"][0]["graphql"]["shortcode_media"]

        if shortcode_media["edge_sidecar_to_children"]
          shortcode_media["edge_sidecar_to_children"]["edges"]
        else
          shortcode_media["display_url"]
        end
      end

      private

      def loop_edges(edges)
        edges.each do |edge|
          node = edge["node"]
          check_time(node["taken_at_timestamp"])
          time = parse_to_date(node["taken_at_timestamp"])
          page_url = "https://www.instagram.com/p/#{node["shortcode"]}/"

          if node["is_video"]
            Logger.info "========VIDEO========".light_yellow
            url = Html.new(page_url).parsing_video_page
            output(time, url)
            File.download(url, 'video', time)
          else
            shortcode_media = Html.new(page_url).parsing_photo_page
            if shortcode_media.is_a? Array
              Logger.info "========POST========".light_magenta
              parse_post(shortcode_media, time)
            else
              Logger.info "========PHOTO========".light_green
              url = shortcode_media
              output(time, url)
              File.download(url, 'photo', time)
            end
          end
        end
      end

      def get_html(url)
        res = Config.proxy ?
          HTTP.via(Config.proxy, 8080).get(url) : HTTP.get(url)
        raise Errors::HttpError, "#{res.code} #{res.reason}" if res.code != 200
        res.to_s
      end
    end
  end
end
