# frozen_string_literal: true

FactoryBot.define do
  factory :job do
    title 'Разработчик'
    employment 'full'
    city 'Москва'
    description 'Штатный программист'
    requirements 'Работать много и пить кофе'

    company_name 'Бадишоп'
    company_contact 'Директор Бадишопа'
    company_email 'email@example.com'
    expired_at Date.current + 1 .week
    token 'token'
    tag_list 'tag1, tag2, tag3'

    trait :invalid do
      description nil
    end

    trait :approved do
      status :approved
    end
  end
end
