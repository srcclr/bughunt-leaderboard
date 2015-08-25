module Leaderboard
  class BoardQueryBuilder
    def initialize(limit, offset)
      @limit = limit
      @offset = offset
    end

    def build
      %(
        SELECT summary.username AS "Username", #{challenge_totals}, sum(summary.points) AS "Total"
        FROM users_with_points summary
        WHERE challenge_id IN (#{challenge_ids})
        GROUP BY username
        ORDER BY sum(summary.points) DESC
        LIMIT #{@limit}
        OFFSET #{@offset}
      )
    end

    private

    def challenge_totals
      challenges.map do |challenge|
        %(
          COALESCE(
            SUM(CASE WHEN summary.challenge_id = #{challenge.first} THEN summary.points ELSE null END), '-'
          ) AS "#{challenge.second}"
        )
      end.join(",")
    end

    def challenge_ids
      challenges.map(&:first).join(", ")
    end

    def challenges
      @challenges ||= Leaderboard::ChallengeQuery.new.call.entries
    end
  end
end
