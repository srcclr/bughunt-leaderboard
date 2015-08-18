lib =  File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Maintain your gem's version:
require "leaderboard/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "leaderboard"
  s.version     = Leaderboard::VERSION
  s.authors     = ["RamilGilmanov"]
  s.email       = ["ramil.gilmanov@flatstack.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Leaderboard."
  s.description = "TODO: Description of Leaderboard."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.3"
  s.add_dependency "mysql2", "~> 0.3.19"

  s.add_development_dependency "rspec-rails", "~> 3.0"
  s.add_development_dependency "rubocop"
  s.add_development_dependency "pry-byebug"
end
