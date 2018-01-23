# frozen_string_literal: true

Given(/^I am on the juniorjobs (\w+) page$/) do |page|
  goto url_for(page)
  @current_page = page_for(page)
end

When(/^I fill the sign up form and submit$/) do
  @current_page.fill_form(@user)
end

Then(/^user redirect to (\w+) page$/) do |page|
  @current_page = page_for(page)
  expect(@browser.url).to be_include(url_for(page))
end

Then(/^user see success msg "([^"]*)"$/) do |text|
  expect(@current_page.text).to be_include text
end

Given(/^I have credentials (\w+) (\w+)/) do |preposition, field|
  @user.send("#{field}=", '') if preposition == 'without'
end

And(/^account should not be created and use see signup form$/) do
  expect(@current_page.text).to be_include 'Зарегистрироваться'
end
