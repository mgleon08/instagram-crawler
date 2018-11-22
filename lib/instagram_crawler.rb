$LOAD_PATH << File.dirname(__FILE__)

require "optparse"
require "http"
require "nokogiri"
require "logger"
require "colorize"

require "instagram_crawler/version"

require "instagram_crawler/main"
require "instagram_crawler/file"
require "instagram_crawler/logger"
require "instagram_crawler/multi_io"
require "instagram_crawler/config"

# parser
require "instagram_crawler/parser/args"
require "instagram_crawler/parser/base"
require "instagram_crawler/parser/html"
require "instagram_crawler/parser/json"

# error
require "instagram_crawler/errors/http_error"
require "instagram_crawler/errors/env_error"
require "instagram_crawler/errors/arg_error"
