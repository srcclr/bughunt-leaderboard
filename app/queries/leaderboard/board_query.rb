module Leaderboard
  class BoardQuery
    def initialize(limit = 100, offset = 0)
      @limit = limit
      @offset = offset
    end

    def call
      create_view
      select_board_data
    end

    private

    def create_view
      Leaderboard::Base.connection.execute(create_view_text)
    end

    def select_board_data
      Leaderboard::Base.connection.execute(select_board_data_text)
    end

    def create_view_text
      %Q(
        CREATE OR REPLACE VIEW users_with_points AS (
        SELECT
          users.id AS user_id,
          users.username,
          challenges.id AS challenge_id,
          challenges.name,
          CASE
          WHEN submissions.is_correct = 0 THEN '0'
            WHEN submissions.is_correct = 1 THEN GREATEST(0, 7 - DATEDIFF(submissions.last_updated, challenges.date_begin))
            ELSE '-'
          END AS points
        FROM users
        LEFT JOIN submissions ON users.id = submissions.user_id
        LEFT JOIN challenges ON challenges.id = submissions.challenge_id
          AND users.exclude_leaderboard = 0 AND challenges.exclude_leaderboard = 0
        )
      )
    end

    def select_board_data_text
      %Q(
        SELECT
          summary.user_id, summary.username, sum(summary.points) AS total_points,
          sum(CASE WHEN summary.challenge_id = 1 THEN summary.points ELSE null END) as points_1,
          sum(CASE WHEN summary.challenge_id = 2 THEN summary.points ELSE null END) as points_2,
          sum(CASE WHEN summary.challenge_id = 3 THEN summary.points ELSE null END) as points_3,
          sum(CASE WHEN summary.challenge_id = 4 THEN summary.points ELSE null END) as points_4,
          sum(CASE WHEN summary.challenge_id = 5 THEN summary.points ELSE null END) as points_5
        FROM users_with_points summary
        GROUP BY 1, 2
        ORDER BY 3 DESC
      )
    end
  end
end
