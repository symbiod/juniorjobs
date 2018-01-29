# frozen_string_literal: true

Given(/^user click (\w+)$/) do |element|
  @current_page.send(element)
end
