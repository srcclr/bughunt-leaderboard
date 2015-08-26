module Leaderboard
  class TotalsViewBuilder
    def build
      %(
        CREATE OR REPLACE VIEW users_with_points AS (
        #{select_fields}
        #{from_tables}
        #{where_condition}
        )
      )
    end

    private

    def select_fields
      %(
        SELECT
          users.id AS user_id, users.username, challenges.id AS challenge_id,
          CASE
            WHEN submissions.is_correct = 0 OR challenges.date_end >= CURDATE() THEN '0'
            WHEN submissions.is_correct = 1
            THEN GREATEST(0, 7 - DATEDIFF(submissions.last_updated, challenges.date_begin))
            ELSE '-'
          END AS points
      )
    end

    def from_tables
      %(
        FROM users
          LEFT JOIN submissions ON users.id = submissions.user_id
          LEFT JOIN challenges ON challenges.id = submissions.challenge_id
      )
    end

    def where_condition
      %(
        WHERE users.exclude_leaderboard = 0 AND challenges.exclude_leaderboard = 0
      )
    end
  end
end
