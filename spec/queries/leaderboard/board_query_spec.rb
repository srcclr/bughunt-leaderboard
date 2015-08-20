require 'rails_helper'

module Leaderboard
  describe BoardQuery do
    let(:query) { described_class.new }

    describe '#call' do
      subject { query.call }

      before { prepare_sample_data }

      context 'fields' do
        let(:expected_fields) do
          ["Username", "points_2", "points_3", "points_4", "points_5", "total_points"]
        end

        it 'should return table columns' do
          expect(subject.fields).to eq(expected_fields)
        end
      end

      context 'data' do
        let(:expected_data) do
          [
            {
              "Username"=>"cherlerngebert2",
              "points_2"=>"7",
              "points_3"=>"0",
              "points_4"=>"7",
              "points_5"=>"0",
              "total_points"=>14.0
            },
            {
              "Username"=>"timstrazz",
              "points_2"=>"-",
              "points_3"=>"-",
              "points_4"=>"3",
              "points_5"=>"7",
              "total_points"=>10.0
            },
            {
              "Username"=>"jjarmoc",
              "points_2"=>"3",
              "points_3"=>"5",
              "points_4"=>"1",
              "points_5"=>"-",
              "total_points"=>9.0
            },
            {
              "Username"=>"pretentiousderp",
              "points_2"=>"0",
              "points_3"=>"-",
              "points_4"=>"7",
              "points_5"=>"0",
              "total_points"=>7.0
            }
          ]
        end

        it 'should return leaderboard' do
          expect(subject.entries).to eq(expected_data)
        end
      end
    end
  end
end
