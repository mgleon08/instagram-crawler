module InstagramCrawler
  class Config
    @default_url = "https://www.instagram.com".freeze
    class << self
      attr_reader :default_url, :user_name, :base_url, :base_path,
                  :log_path, :after_date, :before_date, :parse_after_date, :parse_before_date
      attr_accessor :download, :proxyname
      attr_writer :port

      def user_name=(user_name)
        @user_name = user_name
        @base_url  = "#{default_url}/#{user_name}/"
        @base_path = "./instagram-crawler/#{user_name}"
        @log_path = "./instagram-crawler/#{user_name}/log_file"
      end

      def after_date=(after_date)
        @after_date = after_date
        @parse_after_date = Time.parse(after_date).to_i
      end

      def before_date=(before_date)
        @before_date = before_date
        @parse_before_date = Time.parse(before_date).to_i
      end

      def port
        @port ? @port.to_i : 8080
      end
    end
  end
end
