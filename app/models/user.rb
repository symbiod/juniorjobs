class User < ApplicationRecord
  authenticates_with_sorcery!

  VALID_ROLES = %w(junior company admin)
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/

  validates :password, confirmation: true, presence: true,
            length: { minimum: 6 }
  validates :email, uniqueness: true, presence: true,
            format: { with: EMAIL_REGEX }
  validate :validate_roles

  private

  def validate_roles
    invalid_roles = roles - VALID_ROLES
    invalid_roles.each do |role|
      errors.add(:roles, "#{role} - is not a valid role")
    end
  end
end
