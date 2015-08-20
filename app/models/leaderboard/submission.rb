module Leaderboard
  class Submission < Base
    self.table_name = "submissions"

    belongs_to :user
    belongs_to :challenge

    attr_accessor :hash
  end
end
