module Leaderboard
  class BoardQuery
    def initialize(limit = 100, offset = 0)
      @limit = limit
      @offset = offset
    end

    def call
      verify_totals_view
      select_board_data
    end

    private

    def verify_totals_view
      Leaderboard::Connection.query(Leaderboard::TotalsViewBuilder.new.build)
    end

    def select_board_data
      Leaderboard::Connection.query(Leaderboard::BoardQueryBuilder.new(@limit, @offset).build)
    end
  end
end
