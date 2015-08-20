FactoryGirl.define do
  factory :challenge, class: Leaderboard::Challenge do
    sequence(:name) { |n| "challenge_#{n}" }
    date_begin { 10.days.ago }
    date_end { 1.day.ago }
    solutions "['100']"
  end
end
