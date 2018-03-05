# frozen_string_literal: true

# Policy rules for Cv model
class CvPolicy < ApplicationPolicy
  def own?
    admin? || junior?
  end

  def update?
    admin? || owner?
  end

  def create?
    admin? || owner?
  end

  def destroy?
    update?
  end

  def owner?
    user && user == record.user
  end

  private

  def junior?
    user.role?(:junior)
  end
end
