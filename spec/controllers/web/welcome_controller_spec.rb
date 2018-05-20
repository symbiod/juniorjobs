# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::WelcomeController, type: :controller do
  render_views

  describe '#index' do
    before { get :index }

    include_examples 'meta_tags_specs'

    it 'should render template' do
      expect(response).to render_template(:index)
    end

    it 'should respond with a success status code (2xx)' do
      expect(response).to have_http_status(:success)
    end
  end
end
