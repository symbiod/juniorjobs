# frozen_string_literal: true

# Decorate methods for Cv model.
class CvDecorator < ApplicationDecorator
  delegate_all

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

  EXPIRED_INTERVALS = %w[
    1_week
    2_week
    1_month
  ].freeze

  def expired_at_dates
    EXPIRED_INTERVALS.map { |interval| expired_at_for(interval) }
  end

  def expired_at_for(modifier)
    interval = TimeUtility.parse_interval(modifier)
    date = (persisted? ? created_at.to_date : Date.current) + interval
    text = t("activerecord.attributes.job.expired_ats.#{modifier}", date: date.strftime('%d/%m/%Y'))
    [text, date]
  end
end
