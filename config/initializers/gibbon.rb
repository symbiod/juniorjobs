require 'gibbon'

gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_ACCESS_KEY_ID'])
gibbon.timeout = 15
gibbon.open_timeout = 15
gibbon.symbolize_keys = true
gibbon.debug = false
