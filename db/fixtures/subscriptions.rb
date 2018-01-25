# frozen_string_literal: true

require 'faker'

Subscription.destroy_all

Subscription.seed do |s|
  s.active = true
  s.user_id = 1
  s.email = User.find(1).email
end

Subscription.seed do |s|
  s.active = false
  s.user_id = 2
  s.email = User.find(2).email
end

Subscription.seed do |s|
  s.active = true
  s.user_id = nil
  s.email = Faker::Internet.email
end

Subscription.seed do |s|
  s.active = false
  s.user_id = nil
  s.email = Faker::Internet.email
end
