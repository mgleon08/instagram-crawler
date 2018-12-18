module InstagramCrawler
  module Parser
    class Args
      attr_accessor :log

      def initialize(args)
        @args = args
        parse_args
        validates_required_args
      end

      private

      def parse_args
        opts = OptionParser.new
        opts.banner = usage_msg
        opts.separator ''
        opts.separator 'options:'
        opts.on('-u', '--username USERNAME', 'Instagram username') { |user_name| Config.user_name = user_name }
        opts.on('-d', '--download', 'Download files') { |download| Config.download = true }
        opts.on('-a', '--after DATE', 'Download files after this date (YYYYMMDD)') { |after_date| Config.after_date = after_date }
        opts.on('-l', '--log', 'Generate a log file in the current directory') { self.log = true }
        opts.on('-P', '--proxyname PROXYNAME', 'Specify proxyname of your proxy server') { |proxyname| Config.proxyname = proxyname }
        opts.on('-p', '--port PORT', 'Specify port of your proxy server (default port: 8080)') { |port| Config.port = port }
        opts.on('-v', '--version', 'Show the instagram-crawler version') { puts("instagram-crawler #{InstagramCrawler::VERSION}"); exit }
        opts.on('-h', '--help', 'Show this message') { puts(opts); exit }
        opts.parse!(@args)
      end

      def usage_msg
        <<~USAGE.freeze
        Usage:
          instagram-crawler [options]
          See https://github.com/mgleon08/instagram-crawler for more information.
        USAGE
      end

      def validates_required_args
        if Config.user_name.nil?
          raise InstagramCrawler::Errors::ArgError.new('-u or --username')
        end
      end
    end
  end
end
