FactoryBot.define do
  factory :user, class: OpenStruct do
    Faker::Config.locale = :en
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    email "nn24086+#{Time.now.to_i}@gmail.com"
    password Faker::Internet.password(min_length = 6)
  end
end