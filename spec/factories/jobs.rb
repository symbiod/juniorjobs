FactoryBot.define do
  factory :job do
    id 1
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
    token 'token'

    trait :invalid do
      description nil
    end
  end
end
