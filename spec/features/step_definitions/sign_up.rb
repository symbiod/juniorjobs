# frozen_string_literal: true

When(/^I fill the sign up form and submit$/) do
  @current_page.fill_form(@user)
end

Then(/^user see success msg "([^"]*)"$/) do |text|
  expect(@current_page.text).to be_include text
end

Given(/^I have credentials (\w+) (\w+)/) do |preposition, field|
  @user.send("#{field}=", '') if preposition == 'without'
end

And(/^account should not be created and user see signup form$/) do
  expect(@current_page.text).to be_include 'Зарегистрироваться'
end
