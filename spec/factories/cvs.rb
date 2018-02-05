# frozen_string_literal: true

FactoryBot.define do
  factory :cv do
    title 'Разработчик'
    name 'Имя Фамилия'
    description 'Очень длинное описание'
    status true
    employment 0
    phone '3453454643'
    email 'email@example.com'
    expired_at Date.current + 1 .week
  end

  trait :invalid do
    description nil
  end

  trait :changed do
    phone '3456868676'
  end
end
