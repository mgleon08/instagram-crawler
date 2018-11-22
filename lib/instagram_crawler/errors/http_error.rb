module InstagramCrawler
  module Errors
    class HttpError < StandardError
      def initialize(message)
        super("HttpError: #{message}")
      end
    end
  end
end
