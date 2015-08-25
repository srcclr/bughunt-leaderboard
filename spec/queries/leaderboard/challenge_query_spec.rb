require "rails_helper"

module Leaderboard
  describe ChallengeQuery do
    let(:query) { described_class.new }

    describe "#call" do
      let(:expected_table) do
        [
          [2, "challenge1"],
          [3, "NumberTwo"],
          [4, "The3rd"],
          [5, "Fore"]
        ]
      end

      before { prepare_sample_data }

      subject { query.call }

      it "return active challenges" do
        expect(subject.entries).to eq(expected_table)
      end
    end

    describe "#select_challenges_query" do
      subject { query.send(:select_challenges_query) }

      it "should select maximum 12 challenges" do
        expect(subject).to include("LIMIT 12")
      end
    end
  end
end
