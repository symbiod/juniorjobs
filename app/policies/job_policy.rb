# frozen_string_literal: true

# Policy rules for Job model
class JobPolicy < ApplicationPolicy
  def index
    true
  end

  def update?
    admin? || owner?
  end

  def destroy?
    update?
  end

  private

  def owner?
    user.id == record.user_id
  end
end
