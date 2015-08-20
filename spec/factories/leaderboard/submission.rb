FactoryGirl.define do
  factory :submission , class: Leaderboard::Submission do
    user
    challenge
    submission_count 1
    is_correct 1
    last_updated { 1.day.ago }
    date_create { 10.days.ago }
  end
end
