require 'faker'

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