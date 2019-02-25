# frozen_string_literal: true

require 'sorcery/crypto_providers/bcrypt'

FactoryBot.define do
  sequence :email do |n|
    Faker::Internet.email
  end

  factory :user, class: OpenStruct do
    Faker::Config.locale = :en
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email
    password Faker::Internet.password(6)
    salt { 'asdasdastr4325234324sdfds' }
    crypted_password { Sorcery::CryptoProviders::BCrypt.encrypt(password, salt) }
    roles { %w[junior company].sample }
  end
end
