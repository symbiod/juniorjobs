# frozen_string_literal: true

# Policy rules for Subscription model
class SubscriptionPolicy < ApplicationPolicy
  def index
    admin?
  end
end
