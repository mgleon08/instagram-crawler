module InstagramCrawler
  module Errors
    class EnvError < StandardError
      def initialize
        super("Undefined env variable sessionid\nYou should setting env variable 'export sessionid=[your instagram sessionid]' and execute again.")
      end
    end
  end
end
