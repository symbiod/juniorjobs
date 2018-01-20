# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::SubscriptionsController, type: :controller do
  describe 'GET #index' do
    subject do
      login_user(user)
      get :index
    end

    context 'admin can see subscriptions list' do
      let(:user) { create(:user, :admin) }

      it { is_expected.to render_template(:index) }
    end

    context 'non admin cant see subscriptions list' do
      let(:user) { create(:user, :junior) }

      it { is_expected.to have_http_status(:forbidden) }
    end
  end
end
