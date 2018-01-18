class User < ApplicationRecord
  authenticates_with_sorcery!
  include HasRole

  has_many :authentications, dependent: :destroy
  has_many :jobs
  has_one :subscription

  accepts_nested_attributes_for :authentications

  validates :password, confirmation: true, presence: true, length: { minimum: 6 }
  validates :email, uniqueness: true, presence: true, format: { with: %r[#{Settings.email_regex}] }
end
