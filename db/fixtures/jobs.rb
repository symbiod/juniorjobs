require 'faker'

Job.destroy_all

10.times do |i|
  Job.seed do |s|
    s.id = i
    s.title = Faker::Job.title
    s.description = Faker::Lorem.sentence
    s.token = "token#{i}"
    s.employment = %w[full part contract internal].sample
    s.currency = Settings.currencies.sample
    s.expired_at = Date.current + 1.week
    s.specialization = Faker::ProgrammingLanguage.name
    s.language = %w[English Russian].sample
    s.company_phone = Faker::PhoneNumber.cell_phone
    s.company_page = Faker::Internet.url
    s.company_contact = Faker::Name.name
    s.company_email = Faker::Internet.email
    s.company_name = Faker::Company.name
    s.requirements = Faker::Job.key_skill
    s.salary_from = [*1..3].sample*10000
    s.salary_to = [*3..20].sample*10000
    s.salary_by_agreement = [*0..1].sample
    s.remote = [*0..1].sample
    s.city = Faker::Address.city
    s.country = Faker::Address.country
  end
end
