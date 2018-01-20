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
