require 'watir'

Before do |scenario|
  DataMagic.load_for_scenario(scenario)
  @user = FactoryBot.create :user
  @browser = Watir::Browser.new :firefox

end


After do
  @browser.close
end