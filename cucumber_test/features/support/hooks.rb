# frozen_string_literal: true

require 'watir'

Before do |scenario|
  DataMagic.load_for_scenario(scenario)
  @user = FactoryBot.create :user
  @vacancy = FactoryBot.create :vacancy
  @cucumber_host = ENV['CUCUMBER_HOST'] || 'http://localhost:3000'
  browser_options = ENV['CUCUMBER_HOST'] ? %w[--disable-gpu --headless --no-sandbox] : []

  @browser = Watir::Browser.new(:chrome,
                                switches: browser_options)
end

After do |scenario|
  if scenario.failed?
    screenshot = "./FAILED_#{scenario.name.tr(' ', '_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    @browser.driver.save_screenshot(screenshot)
    encoded_img = @browser.driver.screenshot_as(:base64)
    embed("data:image/png;base64,#{encoded_img}", 'image/png')
  end
  @browser.close
  DatabaseCleaner[:activerecord].clean
end
