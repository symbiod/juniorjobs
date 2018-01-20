# frozen_string_literal: true

require 'faker'

User.destroy_all

User.seed do |s|
  s.password = 'password'
  s.email = Faker::Internet.email
  s.roles = ['junior']
end

User.seed do |s|
  s.password = 'password'
  s.email = Faker::Internet.email
  s.roles = ['company']
end

User.seed do |s|
  s.password = 'password'
  s.email = Faker::Internet.email
  s.roles = ['admin']
end
