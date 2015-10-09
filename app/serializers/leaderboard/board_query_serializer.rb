module Leaderboard
  class BoardQuerySerializer < ActiveModel::Serializer
    self.root = false

    attributes :challenges, :data, :current_index

    private

    def challenges
      @challenges ||= object.fields[1..-2]
    end

    def data
      object.entries
    end

    def current_index
      challenges.select(&:present?).size
    end
  end
end
