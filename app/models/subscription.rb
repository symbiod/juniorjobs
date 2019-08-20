# frozen_string_literal: true

class Subscription < ApplicationRecord
  # belongs_to :user, optional: true
  #
  # validates :email, presence: true, uniqueness: { case_sensitive: false },
  #                   format: { with: /#{Settings.email_regex}/, on: :create }
  #
  # class << self
  #   def unsubscribe(emails)
  #     where(email: emails).update_all(active: false)
  #   end
  # end
end
