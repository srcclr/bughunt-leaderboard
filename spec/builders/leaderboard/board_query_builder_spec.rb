require "spec_helper"

module Leaderboard
  describe BoardQueryBuilder do
    let(:builder) { described_class.new(limit, offset) }
    let(:limit) { 55 }
    let(:offset) { 10 }

    before do
      allow(builder).to receive(:challenges).and_return(
        [[1, "One"], [10, "Ten"], [50, "Fiddy"]]
      )
    end

    subject { builder.build }

    it "should limit selected records" do
      expect(subject).to include("LIMIT 55")
    end

    it "should skip records" do
      expect(subject).to include("OFFSET 10")
    end

    it "should select limited challenges" do
      expect(subject).to include("challenge_id IN (1, 10, 50)")
    end
  end
end
