module HasRole
  extend ActiveSupport::Concern

  VALID_ROLES = %w[junior company admin].freeze

  included do
    validates :roles, presence: true
    validate :roles_value, if: :roles_present?
  end

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
