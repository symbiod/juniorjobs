# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
class User < ApplicationRecord
  include HasRole

  authenticates_with_sorcery!

  has_many :authentications, dependent: :destroy
  has_many :jobs
  has_many :cvs, dependent: :destroy
  has_one :subscription

  accepts_nested_attributes_for :authentications

  validates :password, confirmation: true, presence: true, length: { minimum: 6 }
  validates :email, uniqueness: true, presence: true, format: { with: /#{Settings.email_regex}/ }
  validate  :roles_array?

  private

  def roles_array?
    roles.is_a?(Array) || errors.add(:roles, 'must be an array')
  end
end
