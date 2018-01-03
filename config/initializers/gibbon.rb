require 'dotenv'

Dotenv.load(Rails.root.join('config', 'gibbon.env'))

Gibbon::Request.api_key = ENV['ACCESS_KEY_ID']
Gibbon::Request.timeout = 15
Gibbon::Request.open_timeout = 15
Gibbon::Request.symbolize_keys = true
Gibbon::Request.debug = false