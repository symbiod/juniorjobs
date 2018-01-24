require 'faker'

User.destroy_all

User.seed do |s|
  s.id    = 1
  s.password = "password"
  s.email = Faker::Internet.email
  s.roles  = ['junior']
end

User.seed do |s|
  s.id    = 2
  s.password = "password"
  s.email = Faker::Internet.email
  s.roles  = ['company']
end

User.seed do |s|
  s.id    = 3
  s.password = "password"
  s.email = Faker::Internet.email
  s.roles  = ['admin']
end

User.seed do |s|
  s.id    = 4
  s.password = "123456"
  s.email = "test@test.tt"
  s.roles  = ['junior']
end
