require "rails_helper"

module Leaderboard
  describe BoardQuery do
    let(:query) { described_class.new }

    describe "#call" do
      subject { query.call }

      before { prepare_sample_data }

      context "fields" do
        let(:expected_fields) do
          ["Username", "Week 1", "Week 12", "Total"]
        end

        it "should return table columns" do
          expected_fields.each do |field|
            expect(subject.fields).to include(field)
          end
        end

        it "should return display 14 columns total" do
          expect(subject.fields.count).to eq(14)
        end
      end

      context "data" do
        let(:expected_data) do
          [
            ["cherlerngebert2", "7", "0", "7", "0", "", "", "", "", "", "", "", "", 14.0],
            ["timstrazz", "-", "-", "3", "7", "", "", "", "", "", "", "", "", 10.0],
            ["jjarmoc", "3", "5", "1", "-", "", "", "", "", "", "", "", "", 9.0],
            ["pretentiousderp", "0", "-", "7", "0", "", "", "", "", "", "", "", "", 7.0]
          ]
        end

        it "should return leaderboard" do
          expect(subject.entries).to eq(expected_data)
        end
      end
    end
  end
end
