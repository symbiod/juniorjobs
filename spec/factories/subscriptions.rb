FactoryBot.define do
  factory :subscription do
    email 'example@mail.com'
    active true

    trait :with_user do
      user_id 1
    end
    
    trait :with_no_user do
      user_id nil
    end

    factory :user_subscription,  traits: [:with_user]
    factory :guest_subscription, traits: [:with_no_user]
  end
end