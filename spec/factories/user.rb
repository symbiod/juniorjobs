FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    email
    password 'secret'
    password_confirmation 'secret'
    salt { salt = 'asdasdastr4325234324sdfds' }
    crypted_password { Sorcery::CryptoProviders::BCrypt.encrypt('secret', salt) }

    trait :junior do
      roles ['junior']
    end

    trait :company do
      roles ['company']
    end

    trait :admin do
      roles ['admin']
    end
  end
end