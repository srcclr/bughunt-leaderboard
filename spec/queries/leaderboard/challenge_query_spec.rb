require 'rails_helper'

module Leaderboard
  describe ChallengeQuery do
    let(:query) { described_class.new }

    before { prepare_sample_data }

    describe '#call' do
      let(:expected_table) do
        [
          { "id" => 2, "name" => "challenge1"} ,
          { "id" => 3, "name" => "NumberTwo" },
          { "id" => 4, "name" => "The3rd" },
          { "id" => 5, "name" => "Fore" }
        ]
      end

      subject { query.call }

      it 'return active challenges' do
        expect(subject.entries).to eq(expected_table)
      end
    end
  end
end
