require 'faker'

Cv.destroy_all

20.times do |i|
  Cv.seed do |s|
    s.status = Faker::Boolean.boolean
    s.title = Faker::Job.title
    s.employment = %w[full part contract internal].sample
    s.name = Faker::Name.name
    s.description = Faker::Lorem.sentence
    s.country = Faker::Address.country
    s.city = Faker::Address.city
    s.remote = [*0..1].sample
    s.currency = Settings.currencies.sample
    s.salary_from = [*1..3].sample*10000
    s.salary_to = [*3..20].sample*10000
    s.salary_by_agreement = [*0..1].sample
    s.education = Faker::Lorem.sentence
    s.skills = Faker::Lorem.sentence
    s.work_experience = Faker::Lorem.sentence
    s.expired_at = Date.current + 1.week
    s.address = Faker::Address.street_address
    s.phone = Faker::PhoneNumber.cell_phone
    s.email = Faker::Internet.email
    s.web_site = Faker::Internet.url
    s.user_id = 4
  end
end
