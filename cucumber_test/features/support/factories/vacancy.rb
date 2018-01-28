# frozen_string_literal: true

FactoryBot.define do
  factory :vacancy, class: OpenStruct do
    Faker::Config.locale = :en
    title Faker::Job.title
    employment { %w[full part contract internal][rand(0..3)] }
    description Faker::Lorem.paragraph
    requirements do
      res = []
      10.times { res << "#{Faker::ProgrammingLanguage.name} " }
      res
    end
    city Faker::Address.city
    remote Faker::Boolean.boolean
    company_name Faker::Company.name
    company_page Faker::Internet.url
    company_contact Faker::Company.swedish_organisation_number
    company_phone Faker::PhoneNumber.cell_phone
    company_email Faker::Internet.email
    currency { %w[byn rub uah usd][rand(0..3)] }
    salary_from { rand(1000) }
    salary_to { rand(1001..2000) }
    salary_by_agreement Faker::Boolean.boolean
    expired_at { ['На неделю', 'На 2 недели', 'На месяц'][rand(0..1)] }
  end
end
