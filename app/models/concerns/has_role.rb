# frozen_string_literal: true

# This module adds roles to model (junior, company, admin by default), validates present of roles and their validity.
module HasRole
  extend ActiveSupport::Concern

  included do
    validates :roles, presence: true
    validate :roles_value, if: :roles_present?
  end

  # Adds roles to model if role is valid and doesn't already present
  # @param values [Array<String, Symbol>]
  def add_roles(*values)
    values.map(&:to_s).each do |value|
      roles << value if Settings.valid_roles.include?(value) && !role?(value)
    end
  end

  # Remove roles from model
  # @param values [Array<String, Symbol>]
  def remove_roles(*values)
    self.roles = roles - values.map(&:to_s)
  end

  # Check if model has role
  # @param value [#to_s]
  def role?(value)
    roles.include?(value.to_s)
  end

  private

  def roles_value
    invalid_roles = roles - Settings.valid_roles
    invalid_roles.each do |role|
      errors.add(:roles, "#{role} - is not a valid role")
    end
  end

  def roles_present?
    roles.present?
  end
end
