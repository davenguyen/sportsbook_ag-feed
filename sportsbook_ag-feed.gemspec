$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sportsbook_ag/feed/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sportsbook_ag-feed"
  s.version     = SportsbookAg::Feed::VERSION
  s.authors     = ["Dave Nguyen"]
  s.email       = ["Dave.Nguyen@inthenight.net"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of SportsbookAg::Feed."
  s.description = "TODO: Description of SportsbookAg::Feed."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"
end
