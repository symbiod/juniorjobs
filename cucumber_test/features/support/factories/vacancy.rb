# frozen_string_literal: true

FactoryBot.define do
  factory :vacancy, class: OpenStruct do
    Faker::Config.locale = :en
    title Faker::Name.first_name
    description Faker::Name.last_name
    employment Faker::Name.last_name
    requirements Faker::Name.last_name
    salary_from rand(1000)
    salary_to rand(1000)
    company_name Faker::Company.name
    company_contact Faker::Company.swedish_organisation_number
    company_email "nn24086+#{Time.now.to_i}@gmail.com"
  end
end
