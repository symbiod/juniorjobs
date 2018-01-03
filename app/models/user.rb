class User < ApplicationRecord
  authenticates_with_sorcery!

  VALID_ROLES = %w[junior company admin].freeze
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/

  has_many :jobs

  validates :password, confirmation: true, presence: true,
                       length: { minimum: 6 }

  validates :email, uniqueness: true, presence: true,
                    format: { with: EMAIL_REGEX }

  validates :roles, presence: true
  validate :roles_value, if: :roles_present?

  def add_roles(*values)
    values.map(&:to_s).each do |value|
      roles << value if VALID_ROLES.include?(value) && !has_role?(value)
    end
  end

  def remove_roles(*values)
    self.roles = roles - values.map(&:to_s)
  end

  def has_role?(value)
    roles.include?(value.to_s)
  end

  private

  def roles_value
    invalid_roles = roles - VALID_ROLES
    invalid_roles.each do |role|
      errors.add(:roles, "#{role} - is not a valid role")
    end
  end

  def roles_present?
    roles.present?
  end
end
