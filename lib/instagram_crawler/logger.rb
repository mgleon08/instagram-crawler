module InstagramCrawler
  class Logger < ::Logger
    class << self
      def setting(log)
        io = [STDOUT]
        io << log_file if log
        logger = Logger.new(MultiIO.new(*io))
        logger.level = Logger::INFO
        logger.formatter = proc do |_severity, _datetime, _progname, msg|
          "#{msg}\n"
        end
        @logger = logger
      end

      def info(str)
        @logger.info(str)
      end

      private

      def log_file
        time = Time.now.strftime('%Y-%m-%dT%H:%M:%S')
        FileUtils.mkdir_p(Config.log_path) unless Dir.exist?(Config.log_path)
        log_file = File.open("#{Config.log_path}/#{time}.txt", 'a')
        log_file
      end
    end
  end
end
