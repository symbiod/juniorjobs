FactoryBot.define do
  factory :job do
    status false
    title 'Разработчик'
    employment 'full'
    city  'Москва'
    description 'Штатный программист'
    requirements 'Работать много и пить кофе'

    company_name 'Бадишоп'
    company_contact 'Директор Бадишопа'
    company_email 'email@example.com'
    expired_at Date.current + 1 .week
    token TokenGenerator.new.generate

    trait :invalid do
      description nil
    end

    trait :wrong_token do
      token nil
    end
  end
end
