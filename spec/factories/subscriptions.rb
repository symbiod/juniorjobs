FactoryBot.define do
  factory :subscription do
    email
    trait :user do
      user_id nil
    end
  end
end
