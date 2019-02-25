# frozen_string_literal: true

Given(/^I am on the juniorjobs (\w+) page$/) do |page|
  goto url_for(page)
  @current_page = page_for(page)
end

Given(/^user click (\w+)$/) do |element|
  @current_page.send(element)
end

Then(/^user redirect to (\w+) page$/) do |page|
  @current_page = page_for(page)
  expect(@browser.url).to be_include(url_for(page))
end
