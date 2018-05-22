require 'faker'

User.destroy_all

User.seed do |s|
  s.id    = 1
  s.password = 'password'
  s.password_confirmation = 'password'
  s.salt = 'asdasdastr4325234324sdfds'
  s.crypted_password = Sorcery::CryptoProviders::BCrypt.encrypt('password', 'asdasdastr4325234324sdfds')
  s.email = Faker::Internet.email
  s.roles  = ['junior']
end

User.seed do |s|
  s.id    = 2
  s.password = 'password'
  s.password_confirmation = 'password'
  s.salt = 'asdasdastr4325234324sdfds'
  s.crypted_password = Sorcery::CryptoProviders::BCrypt.encrypt('password', 'asdasdastr4325234324sdfds')
  s.email = Faker::Internet.email
  s.roles  = ['company']
end

User.seed do |s|
  s.id    = 3
  s.password = 'password'
  s.password_confirmation = 'password'
  s.salt = 'asdasdastr4325234324sdfds'
  s.crypted_password = Sorcery::CryptoProviders::BCrypt.encrypt('password', 'asdasdastr4325234324sdfds')
  s.email = 'admin@example.com'
  s.roles  = ['admin']
end

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
    s.status = %w[approved not_approved].sample
  end
end

Subscription.destroy_all

Subscription.seed do |s|
  s.id    = 1
  s.active = true
  s.user_id = 1
  s.email  = User.find(1).email
end

Subscription.seed do |s|
  s.id    = 2
  s.active = false
  s.user_id = 2
  s.email  = User.find(2).email
end

Subscription.seed do |s|
  s.id    = 3
  s.active = true
  s.user_id = nil
  s.email  = Faker::Internet.email
end

Subscription.seed do |s|
  s.id    = 4
  s.active = false
  s.user_id = nil
  s.email  = Faker::Internet.email
end
