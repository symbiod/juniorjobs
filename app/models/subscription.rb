# frozen_string_literal: true

# Keeps subscription model
class Subscription < ApplicationRecord
  belongs_to :user, optional: true

  validates :email, presence: true, uniqueness: { case_sensitive: false },
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  class << self
    def unsubscribe(emails)
      where(email: emails).update_all(active: false)
    end
  end
end
