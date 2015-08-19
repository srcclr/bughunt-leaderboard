module Leaderboard
  class Base < ActiveRecord::Base
    self.abstract_class = true

    establish_connection DB_CONFIG["bot_#{Rails.env}"]
  end
end
