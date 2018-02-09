# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
class Cv < ApplicationRecord
  belongs_to :user

  validates :title, :name, length: { minimum: 5, maximum: 50 }
  validates :description, length: { minimum: 10, maximum: 1200 }
  validates :title, :name, :employment, :description, presence: true
  validates :phone, :email, presence: true
  validates :salary_from, :salary_to, numericality: { only_integer: true }, allow_blank: true

  enum employments: { full: 0, part: 1, contract: 2, internal: 3 }
  enum currencies: Settings.currencies
end
