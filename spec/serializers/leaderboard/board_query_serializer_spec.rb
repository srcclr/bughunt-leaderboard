require "rails_helper"

module Leaderboard
  describe BoardQuerySerializer do
    describe "#as_json" do
      let(:serializer) { described_class.new(query) }
      let(:query) { double(:query, fields: %w(id name), entries: [1, 2, 3]) }

      let(:expected_json) do
        {
          columns: %w(id name),
          data: [1, 2, 3]
        }
      end

      it "should serialize query" do
        expect(serializer.as_json).to eq(expected_json)
      end
    end
  end
end
