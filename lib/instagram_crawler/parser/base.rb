module InstagramCrawler
  module Parser
    class Base
      private

      def parse_post(posts, time)
        posts.each.with_index(1) do |post, index|
          url = post["node"]["display_url"]
          output(time, url)
          File.download(url, "post/#{time}", "#{index}.#{time}")
        end
      end

      def output(time, url)
        Logger.info "[#{time}]".light_cyan + " #{url}"
      end

      def parse_to_date(ts)
        Time.at(ts).strftime('%Y-%m-%dT%H:%M')
      end

      def check_time(time)
        if Config.after_date && (Config.parse_date > time)
          Logger.info "\nSuccess, the files after #{Config.after_date} have been downloaded!".light_green
          exit
        end
      end
    end
  end
end
