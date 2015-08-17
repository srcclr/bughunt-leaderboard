module Leaderboard
  class Base < ActiveRecord::Base
    self.abstract = true
  end
end
