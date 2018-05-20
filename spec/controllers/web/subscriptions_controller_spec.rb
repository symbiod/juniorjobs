# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::SubscriptionsController, type: :controller do
  describe '#create' do
    subject { post 'create', params: { subscription: attributes_for(:guest_subscription) } }

    it 'should create subscription' do
      expect { subject }.to change(Subscription.all, :count).by(1)
    end

    it 'redirects to root view' do
      expect(subject).to redirect_to(root_path)
    end
  end
end
