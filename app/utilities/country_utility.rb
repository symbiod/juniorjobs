# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
module CountryUtility
  module_function

  DOMAINS = {
    ru: 'juniorjobs.ru',
    by: 'juniorjobs.by',
    ua: 'juniorjobs.com.ua'
  }.freeze

  def translate(country_name)
    country = ISO3166::Country[country_name]
    country.translations[I18n.locale.to_s] || country.name
  end
end
