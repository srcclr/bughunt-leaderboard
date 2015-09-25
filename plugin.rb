# name: leaderboard
# about: BugHunt Leaderboard
# version: 0.0.2

gem "mysql2", "0.3.19"

require(File.expand_path("../lib/leaderboard", __FILE__))

Discourse::Application.routes.append do
  mount Leaderboard::Engine, at: "/bughunt"
end
