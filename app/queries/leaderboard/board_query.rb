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
      Leaderboard::Connection.query(create_view_text)
    end

    def select_board_data
      Leaderboard::Connection.query(select_board_data_text)
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
        WHERE users.exclude_leaderboard = 0 AND challenges.exclude_leaderboard = 0
        )
      )
    end

    def select_board_data_text
      %Q(
        SELECT
          summary.username as "Username",
          COALESCE(sum(CASE WHEN summary.challenge_id = 2 THEN summary.points ELSE null END), '-') as "points_2",
          COALESCE(sum(CASE WHEN summary.challenge_id = 3 THEN summary.points ELSE null END), '-') as "points_3",
          COALESCE(sum(CASE WHEN summary.challenge_id = 4 THEN summary.points ELSE null END), '-') as "points_4",
          COALESCE(sum(CASE WHEN summary.challenge_id = 5 THEN summary.points ELSE null END), '-') as "points_5",
          sum(summary.points) AS total_points
        FROM users_with_points summary
        GROUP BY username
        ORDER BY total_points DESC
      )
    end
  end
end
