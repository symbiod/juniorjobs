# # frozen_string_literal: true

# # Keeps relate to location methods
# module CountryUtility
#   module_function

#   DOMAINS = {
#     ru: 'juniorjobs.ru',
#     by: 'juniorjobs.by',
#     ua: 'juniorjobs.com.ua'
#   }.freeze

#   def translate(country_name)
#     country = ISO3166::Country[country_name]
#     country.translations[I18n.locale.to_s] || country.name
#   end
# end
