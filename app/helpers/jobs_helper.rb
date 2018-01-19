# frozen_string_literal: true

<<<<<<< cucumber_test
# TODO: documentation is missing for this class
# We should consider addig some documentation here
=======
>>>>>>> Massive rubocop corrections
module JobsHelper
  def country_name(job)
    country = ISO3166::Country[job.country]
    country.translations[I18n.locale.to_s] || country.name
  end

  def time_ago_from(time)
    ((Time.now - time) / 1.day).floor
  end

  def salary(job)
    if job.salary_by_agreement
      t('activerecord.attributes.job.salary_by_agreement')
    else
      salary_range = [job.salary_from, job.salary_to].compact.map { |salary| number_with_delimiter(salary) }
      salary_range.join(' - ')
    end
  end
end
