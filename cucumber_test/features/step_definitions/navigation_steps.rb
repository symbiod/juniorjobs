# frozen_string_literal: true

Given(/^user click (\w+)$/) do |element|
  puts @current_page.methods
  @current_page.send(element)
end
