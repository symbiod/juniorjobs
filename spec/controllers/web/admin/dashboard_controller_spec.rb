# frozen_string_literal: true

require 'rails_helper'
require 'aasm/rspec'

RSpec.describe Web::Admin::DashboardController, type: :controller do
  describe 'GET #index' do
    subject do
      login_user(user)
      get :index
    end

    context 'admin can see admin dashboard' do
      let(:user) { create(:user, :admin) }

      it { is_expected.to render_template(:index) }
      it { is_expected.to have_http_status(:success) }
    end

    context 'non admin cant see admin dashboard' do
      let(:user) { create(:user, :junior) }

      it { is_expected.to have_http_status(:forbidden) }
    end

    context 'anonym cant see admin dashboard' do
      it 'redirects to login path' do
        get :index
        expect(response).to redirect_to login_path
      end
    end
  end
end
