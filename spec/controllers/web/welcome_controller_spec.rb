# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::WelcomeController, type: :controller do
  # render_views
  #
  # describe '#index' do
  #   before { get :index }
  #
  #   it { is_expected.to render_template(:index) }
  #   it 'should respond with a success status code (2xx)' do
  #     expect(response).to have_http_status(:success)
  #   end
  #
  #   it 'has correct meta description' do
  #     desc_text = 'JuniorJobs it is resource for free publication of vacancies'
  #     desc_tag = "meta[name=\"description\"][content=\"#{desc_text}\"]"
  #     expect(response.body).to have_css(desc_tag, visible: false)
  #   end
  #
  #   it 'has correct meta keywords' do
  #     key_text = 'Vacancies, junior, job, jobs, work, remote, free, developers, testers'
  #     key_tag = "meta[name=\"keywords\"][content=\"#{key_text}\"]"
  #     expect(response.body).to have_css(key_tag, visible: false)
  #   end
  # end
end
