module Leaderboard
  class Base < ActiveRecord::Base
    self.abstract_class = true

    establish_connection "bot_#{Rail.env}"
  end
end
