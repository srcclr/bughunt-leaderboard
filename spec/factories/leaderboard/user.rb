FactoryGirl.define do
  factory :user, class: Leaderboard::User do
    sequence(:id) { |n| n }
    user_type
    sequence(:username) { |n| "user_#{n}" }
    code { 'some code' }
    date_created { Date.yesterday }
    exclude_leaderboard { 0 }
  end
end
