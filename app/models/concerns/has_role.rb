# This module adds roles to model (junior, company, admin by default), validates present of roles and their validity.

module HasRole
  extend ActiveSupport::Concern

  VALID_ROLES = %w[junior company admin].freeze

  included do
    validates :roles, presence: true
    validate :roles_value, if: :roles_present?
  end

# Adds roles to model if role is valid and doesn't already present
# @param values [Array<String, Symbol>]
  def add_roles(*values)
    values.map(&:to_s).each do |value|
      roles << value if VALID_ROLES.include?(value) && !has_role?(value)
    end
  end

# Remove roles from model
# @param values [Array<String, Symbol>]
  def remove_roles(*values)
    self.roles = roles - values.map(&:to_s)
  end

# Check if model has role
# @param value [#to_s]
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
