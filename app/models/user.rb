# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
class User < ApplicationRecord
  include HasRole

  authenticates_with_sorcery!

  has_many :authentications, dependent: :destroy
  has_many :jobs
  has_one :subscription

  accepts_nested_attributes_for :authentications

  validates :password, confirmation: true, presence: true, length: { minimum: 6 }
  validates :email, uniqueness: true, presence: true, format: { with: /#{Settings.email_regex}/ }
  validate :roles, :is_array

  
  private

  def is_array
    if !roles.kind_of?(Array)
      roles.errors.add(:roles, "must be an array")
    end
  end  
end
