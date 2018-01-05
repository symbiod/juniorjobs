class Job < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, length: { minimum: 5, maximum: 50 }
  validates :description, length: { minimum: 10, maximum: 1200 }
  validates :title, :employment_type, :description, :requirements, presence: true
  validates :company_name, :company_contact, :company_email, presence: true
  validates :salary_from, :salary_to, numericality: { only_integer: true }, allow_blank: true

  enum employment_type: %w[full part contract internal]
  enum currency: %w[rub usd byn uah]

  scope :published_today, Jobs::Published::TodayScope
  scope :published_yesterday, Jobs::Published::YesterdayScope
  scope :published_last_week, Jobs::Published::LastWeekScope
  scope :published_last_month, Jobs::Published::LastMonthScope
end
