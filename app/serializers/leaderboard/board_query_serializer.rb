module Leaderboard
  class BoardQuerySerializer < ActiveModel::Serializer
    attributes :columns, :data

    private

    def columns
      object.fields
    end

    def data
      object.entries
    end
  end
end
