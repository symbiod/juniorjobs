require 'rails_helper'

RSpec.describe Web::SubscriptionsController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes and with user' do
      subject { post 'create', params: { subscription: attributes_for(:subscription, :with_user) }}

      it 'saves the new subscription to database' do
        expect { subject }.to change(Subscription.all, :count).by(1)
      end

      it 'redirects to root' do
        expect(subject).to redirect_to(root_path)
      end
    end

    context 'with valid attributes and without user' do
      subject { post 'create', params: { subscription: attributes_for(:subscription, :with_no_user) }}

      it 'saves the new job to database' do
        expect { subject }.to change(Subscription.all, :count).by(1)
      end

      it 'redirects to root view' do
        expect(subject).to redirect_to(root_path)
      end
    end
  end
end
