module Leaderboard
  class Base < ActiveRecord::Base
    self.abstract_class = true

    establish_connection DB_CONFIG["bot_#{ENV['RAILS_ENV']}"]
  end
end
