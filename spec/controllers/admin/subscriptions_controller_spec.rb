# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::Admin::SubscriptionsController, type: :controller do
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

  describe 'DELETE #destroy' do
    let(:subscription) { create(:subscription) }

    context 'admin can delete subscriptions' do
      let(:admin) { create(:user, :admin) }

      before do
        login_user(admin)
        delete 'destroy', params: { id: subscription.id }
      end

      it 'delete subscription' do
        expect(Subscription.exists?(subscription.id)).to eq false
      end

      it 'redirects to admin subscriptions page' do
        is_expected.to redirect_to admin_subscriptions_path
      end
    end

    context 'other user cannot delete subscriptions in admin namespace' do
      let(:user) { create(:user, :company) }

      before do
        login_user(user)
        delete 'destroy', params: { id: subscription.id }
      end

      it 'not delete subscription' do
        expect(Subscription.exists?(subscription.id)).to eq true
      end

      it 'show forbidden status' do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
