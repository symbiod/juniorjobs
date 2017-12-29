class Job < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 5, maximum: 50 }
  validates :description, presence: true,
                          length: { minimum: 10, maximum: 1200 }

  validates :employment_type, :city, :tasks,
            :requirements, :condition, presence: true
  validates :salary_from, :salary_to, numericality: { only_integer: true },
                                      allow_blank: true
  belongs_to :user
end
