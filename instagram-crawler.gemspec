
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "instagram_crawler/version"

Gem::Specification.new do |spec|
  spec.name          = "instagram-crawler"
  spec.version       = InstagramCrawler::VERSION
  spec.authors       = ["Leon Ji"]
  spec.email         = ["mgleon08@gmail.com"]

  spec.summary       = %q{The easiest way to download instagram photos, posts and videos.}
  spec.description   = %q{Crawl instagram photos, posts and videos for download.}
  spec.homepage      = "https://github.com/mgleon08/instagram-crawler"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/mgleon08/instagram-crawler"
    spec.metadata["changelog_uri"] = "https://github.com/mgleon08/instagram-crawler"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["instagram-crawler"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.5.1"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "nokogiri", "~> 1.8"
  spec.add_runtime_dependency "http", "~> 4.0"
  spec.add_runtime_dependency "colorize", "~> 0.8"
end
