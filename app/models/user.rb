class User < ApplicationRecord
  authenticates_with_sorcery!
  include HasRole
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  VALID_ROLES = %w[junior company admin].freeze
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/

  has_many :jobs
  has_one :subscription

  validates :password, confirmation: true, presence: true, length: { minimum: 6 }
  validates :email, uniqueness: true, presence: true, format: { with: EMAIL_REGEX }
end
