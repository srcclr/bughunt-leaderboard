module Leaderboard
  class BoardQuerySerializer < ActiveModel::Serializer
    self.root = false

    attributes :challenges, :data

    private

    def challenges
      object.fields[1..-2]
    end

    def data
      object.entries
    end
  end
end
