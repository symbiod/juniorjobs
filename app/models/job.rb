class Job < ApplicationRecord
  belongs_to :user, optional: true

  validates :token, presence: true
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
end
