module Leaderboard
  class BoardQueryBuilder
    CHALLENGE_COUNT = 12

    def initialize(limit, offset)
      @limit = limit
      @offset = offset
    end

    def build
      %(
        SELECT summary.username AS "Username",
        #{challenge_totals}, #{future_challenge_totals},
        sum(summary.points) AS "Total"
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
          CASE WHEN '#{challenge.third}' >= CURDATE() THEN '' ELSE
            COALESCE(SUM(CASE WHEN summary.challenge_id = #{challenge.first} THEN summary.points ELSE null END), '-')
          END AS "#{link_to_challenge(challenge.second)}"
        )
      end.join(",")
    end

    def future_challenge_totals
      (challenges.count + 1..CHALLENGE_COUNT).map { %('' as "") }.join(",")
    end

    def challenge_ids
      challenges.map(&:first).join(", ")
    end

    def challenges
      @challenges ||= Leaderboard::ChallengeQuery.new.call.entries.last(CHALLENGE_COUNT)
    end

    def link_to_challenge(challenge_url)
      challenge_url.presence || "#"
    end
  end
end
