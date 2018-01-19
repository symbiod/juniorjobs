# frozen_string_literal: true

FactoryBot.define do
  factory :subscription do
    email 'example@mail.com'
    active true

    trait :with_user do
      association :user, factory: :user, strategy: :build
    end

    factory :user_subscription, traits: [:with_user]
    factory :guest_subscription
  end
end
