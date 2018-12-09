module InstagramCrawler
  class Config
    @default_url = "https://www.instagram.com".freeze
    class << self
      attr_reader :default_url, :user_name, :base_url, :base_path,
                  :log_path, :after_date, :parse_date
      attr_accessor :download, :proxy

      def user_name=(user_name)
        @user_name = user_name
        @base_url  = "#{default_url}/#{user_name}/"
        @base_path = "./instagram-crawler/#{user_name}"
        @log_path = "./instagram-crawler/#{user_name}/log_file"
      end

      def after_date=(after_date)
        @after_date = after_date
        @parse_date = Time.parse(after_date).to_i
      end
    end
  end
end
