module Leaderboard
  class ChallengeQuery
    def call
      Leaderboard::Connection.query(select_challenges_query)
    end

    private

    def select_challenges_query
      %(
        SELECT id, name, date_end
        FROM challenges
        WHERE exclude_leaderboard = 0
        AND date_begin <= CURDATE()
        ORDER BY date_begin
        LIMIT 12
      )
    end
  end
end
