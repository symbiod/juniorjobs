# frozen_string_literal: true

require 'watir'

Before do |scenario|
  DataMagic.load_for_scenario(scenario)
  @user = FactoryBot.create :user

  @cucumber_host = ENV['CUCUMBER_HOST'] || 'http://localhost:3000'
  browser_options = ENV['CUCUMBER_HOST'] ? %w[--disable-gpu --headless --no-sandbox] : []

  @browser = Watir::Browser.new(:chrome,
                                switches: browser_options)
end

After do
  @browser.close
  DatabaseCleaner[:activerecord].clean
end
