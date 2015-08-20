require 'rails_helper'

module Leaderboard
  describe BoardQuery do
    let(:query) { described_class.new }

    include_context 'sample board data'

    describe '#call' do
      let(:expected_table) do
        'Some table here'
      end

      subject { query.call }

      it 'should return leaderboard' do
        binding.pry
        expect(subject).to eq(expected_table)
      end
    end
  end
end
