FactoryGirl.define do
  factory :user_type, class: Leaderboard::UserType do
    sequence(:id) { |n| n }
  end
end
