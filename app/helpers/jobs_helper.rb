module JobsHelper
  def country_name(job)
    country = ISO3166::Country[job.country]
    country.translations[I18n.locale.to_s] || country.name
  end

  # def location(job)
  #   [country_name(job), job.city].compact.join(', ')
  # end
  #
  # def salary(job)
  #   if job.salary_by_agreement
  #     t('web.helpers.jobs.salary_by_agreement')
  #   else
  #     salary_range = [job.salary_from, job.salary_to].compact.map { |salary| number_with_delimiter(salary) }
  #     salary_range.join(' - ') + " #{@job.currency}"
  #   end
  # end
end
