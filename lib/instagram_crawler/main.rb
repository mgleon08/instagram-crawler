module InstagramCrawler
  class Main
    def self.run
      Logger.info text_to_ASCII.light_red
      Logger.info "Running instagram_crawler v#{InstagramCrawler::VERSION}\n"
      start_time = Time.now
      File.mkdir
      page_info, user_id = Parser::Html.new(Config.base_url).parsing
      Parser::Json.new(page_info, user_id).parsing if page_info["has_next_page"]
      end_time = Time.now
      Logger.info "\nSuccess, all files have been downloaded!".light_green
    end

    private

    def self.text_to_ASCII
      <<~USAGE.freeze
  ___         _                               ___                 _
 |_ _|_ _  __| |_ __ _ __ _ _ _ __ _ _ __    / __|_ _ __ ___ __ _| |___ _ _
  | || ' \\(_-<  _/ _` / _` | '_/ _` | '  \\  | (__| '_/ _` \\ V  V / / -_) '_|
 |___|_||_/__/\\__\\__,_\\__, |_| \\__,_|_|_|_|  \\___|_| \\__,_|\\_/\\_/|_\\___|_|
                      |___/
      USAGE
    end
  end
end
