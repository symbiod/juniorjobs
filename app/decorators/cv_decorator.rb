# frozen_string_literal: true

# Decorate methods for Cv model.
class CvDecorator < ApplicationDecorator
  delegate_all

  TIME_INTERVALS = [
    [1.week, '1_week'],
    [2.week, '2_week'],
    [1.month, '1_month']
  ].freeze

  def city_remote
    i18n_remote = I18n.t('activerecord.attributes.job.remote')

    "#{city if city.present?}#{remote.present? ? + '/' + i18n_remote : ''}"
  end

  def salary
    if salary_by_agreement
      t('activerecord.attributes.job.salary_by_agreement')
    else
      salary_range = [salary_from, salary_to].compact.map do |salary|
        number_with_delimiter(salary)
      end

      salary_range.join(' - ')
    end
  end

  def expired_at_dates
    TIME_INTERVALS.map { |interval| expired_at_for interval }
  end

  def expired_at_for(interval)
    date = (persisted? ? created_at.to_date : Date.current) + interval[0]
    text = t("activerecord.attributes.job.expired_ats.#{interval[1]}", date: date.strftime('%d/%m/%Y'))
    [text, date]
  end
end
