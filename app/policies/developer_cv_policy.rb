# frozen_string_literal: true

# Policy rules for Cv model
class DeveloperCvPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
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
    user == record.user
  end
end
