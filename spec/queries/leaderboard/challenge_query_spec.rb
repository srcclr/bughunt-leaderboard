require 'rails_helper'

module Leaderboard
  describe ChallengeQuery do
    let(:query) { described_class.new }

    before { prepare_sample_data }

    describe '#call' do
      let(:expected_table) do
        [
          [2, "challenge1"],
          [3, "NumberTwo"],
          [4, "The3rd"],
          [5, "Fore"]
        ]
      end

      subject { query.call }

      it 'return active challenges' do
        expect(subject.entries).to eq(expected_table)
      end
    end
  end
end
