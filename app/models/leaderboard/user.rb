module Leaderboard
  class User < Base
    self.table_name = "users"

    belongs_to :user_type
  end
end
