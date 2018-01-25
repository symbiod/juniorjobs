# frozen_string_literal: true

# Policy rules for User model
class UserPolicy < ApplicationPolicy
  def index
    admin?
  end

  def update?
    admin? || user.id == record.id
  end

  def destroy?
    update?
  end
end
