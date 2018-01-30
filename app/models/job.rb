# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
class Job < ApplicationRecord
  include AASM

  acts_as_taggable

  belongs_to :user, optional: true

  validates :token, presence: true, unless: :owner?
  validates :title, length: { minimum: 5, maximum: 50 }
  validates :description, length: { minimum: 10, maximum: 1200 }
  validates :title, :employment, :description, :requirements, presence: true
  validates :company_name, :company_contact, :company_email, presence: true
  validates :salary_from, :salary_to, numericality: { only_integer: true }, allow_blank: true

  enum employments: { full: 0, part: 1, contract: 2, internal: 3 }
  enum currencies: Settings.currencies

  scope :published_today, Jobs::Published::TodayScope
  scope :published_yesterday, Jobs::Published::YesterdayScope
  scope :published_last_week, Jobs::Published::LastWeekScope
  scope :published_last_month, Jobs::Published::LastMonthScope

  scope :status, Jobs::StatusScope

  aasm column: 'status' do
    state :not_approved, initial: true
    state :approved

    event :approve do
      transitions from: :not_approved, to: :approved
    end

    event :not_approve do
      transitions from: :approved, to: :not_approved
    end
  end

  private

  def owner?
    user_id.present?
  end
end
