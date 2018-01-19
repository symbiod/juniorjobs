# frozen_string_literal: true

class Subscription < ApplicationRecord
  validates :email, presence: true,
                    format: { with: /#{Settings.email_regex}/, on: :create },
                    uniqueness: { case_sensitive: false }
  belongs_to :user, optional: true
end
