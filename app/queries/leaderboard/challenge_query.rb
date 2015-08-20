module Leaderboard
  class ChallengeQuery
    def call
      Leaderboard::Connection.query(select_challenges_query)
    end

    private

    def select_challenges_query
      %Q(
        SELECT id, name
        FROM challenges
        WHERE exclude_leaderboard = 0
        ORDER BY date_begin
      )
    end
  end
end
