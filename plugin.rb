# name: leaderboard
# about: BugHunt Leaderboard
# version: 0.0.1

# register_asset("javascripts/discourse/templates/leaderboard/boards.hbs")
# register_asset("javascripts/discourse/leaderboard-route-map.js.es6")
# register_asset("stylesheets/leaderboard/application.css.scss")

gem "mysql2", "0.3.19"

require(File.expand_path("../lib/leaderboard", __FILE__))

Discourse::Application.routes.append do
  mount Leaderboard::Engine, at: "/leaderboard"
end
