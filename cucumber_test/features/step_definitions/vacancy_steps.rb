# frozen_string_literal: true

When(/^user fill vacancy form$/) do
  @current_page.fill_form(@vacancy)
end

And(/^user see his vacancy$/) do
  pending
end

Given(/^user have vacancy with ([^"]*) ([^"]*)$/) do |preposition, field|
  @vacancy.send("#{field}=", '') if preposition == 'blank'
end

Then(/^user see vacancy form$/) do
  expect(@current_page.new_job_form_element).to be_visible
end

And(/^user see error message: ([^"]*)$/) do |text|
  expect(@current_page.text).to be_include(text)
end


Given(/^default vacancies exist$/) do
  @dataset = Datasets::Resolver.get_list(:crm_candidate, 'candidates').values
  @dataset.each do |candidate|
    Models::Crm::CrmCandidate.create!(candidate)
  end
  @crm_candidates = Models::Crm::CrmCandidate.all
end