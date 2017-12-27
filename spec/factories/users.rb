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

    trait :with_roles do
      transient do
        roles %w(junior company admin)
      end

      after(:build) do |user, evaluator|
        user.roles = evaluator.roles
      end
    end
  end
end
