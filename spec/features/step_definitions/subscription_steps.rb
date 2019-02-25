# frozen_string_literal: true

Given(/^User subscribes/) do
  @subscription = FactoryBot.create :subscription
end

Given(/^User on the juniorjobs (\w+) page$/) do |page|
  goto url_for(page)
  @current_page = page_for(page)
end

When(/^User fill subscriptions form and submit/) do
  @current_page.fill_form(@subscription)
end

Given(/^User have subscription ([^"]*) with ([^"]*)/) do |field, data|
  @subscription.send("#{field}=", data)
end

And(/^User see message: (([^"]*)||"([^"]*)")$/) do |text|
  expect(@current_page.text).to be_include(text)
end
