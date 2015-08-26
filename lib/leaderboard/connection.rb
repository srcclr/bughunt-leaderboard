module Leaderboard
  class Connection
    class << self
      def query(text)
        client.abandon_results!
        client.query(text, as: :array)
      end

      private

      def client
        @client ||= Mysql2::Client.new(
          (DB_CONFIG["bot_#{ENV['RAILS_ENV']}"] || {}).merge(flags: Mysql2::Client::MULTI_STATEMENTS)
        )
      end
    end
  end
end
