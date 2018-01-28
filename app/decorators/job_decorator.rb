# frozen_string_literal: true

# Decorate methods for Job model. Example: @jobs = Job.all.decorate
class JobDecorator < ApplicationDecorator
  delegate_all

  def expiration
    Date.today < object.expired_at ? t('decorators.job.active_status') : t('decorators.job.expired_status')
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

  def location
    city + ' ' + (remote ? + ' / ' + t('activerecord.attributes.job.remote') : '')
  end

  def country_name
    CountryUtility.translate(country)
  end
end
