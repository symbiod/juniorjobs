# frozen_string_literal: true

# Policy rules for Cv model
class CvPolicy < ApplicationPolicy
  def index?
    true
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

  def edit?
    admin? || owner?
  end

  def new?
    true
  end

  def owner?
    user == record.user && user != nil
  end
end
