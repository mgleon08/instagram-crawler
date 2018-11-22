module InstagramCrawler
  module Errors
    class ArgError < StandardError
      def initialize(message)
        super("Missing argument: #{message}")
      end
    end
  end
end
