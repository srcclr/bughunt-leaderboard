module Leaderboard
  class ChallengeQuery
    def call
      client.query(select_challenges_query)
    end

    private

    def client
      @client ||= Mysql2::Client.new(DB_CONFIG["bot_#{ENV['RAILS_ENV']}"])
    end

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
