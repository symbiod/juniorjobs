# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::StaticPagesController, type: :controller do
  render_views

  describe '#about' do
    before { get :about }

    it { is_expected.to render_template(:about) }
    it 'should respond with a success status code (2xx)' do
      expect(response).to have_http_status(:success)
    end
  end

  describe '#terms' do
    before { get :terms }

    it { is_expected.to render_template(:terms) }
    it 'should respond with a success status code (2xx)' do
      expect(response).to have_http_status(:success)
    end
  end

  describe '#contact_us' do
    before { get :contact_us }

    it { is_expected.to render_template(:contact_us) }
    it 'should respond with a success status code (2xx)' do
      expect(response).to have_http_status(:success)
    end
  end
end
