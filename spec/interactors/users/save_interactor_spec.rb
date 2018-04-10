# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::SaveInteractor do
  let(:permitted_roles) { %w[junior company] }

  subject(:context) { described_class.call(params: params, roles: permitted_roles, user: user) }

  describe '.call' do
    context 'when validate new user with valid attributes' do
      let(:user) { build(:user, :junior) }
      let(:params) { user.attributes.except(:crypted_password, :salt) }

      it 'succeeds' do
        expect(context).to be_a_success
      end

      it 'creates new user' do
        expect { context }.to change(User, :count).by(1)
      end
    end

    context 'when validate existed user with valid attributes' do
      let(:user) { create(:user, :junior) }
      let(:new_password) { 'newpassword' }
      let(:params) do
        Hash(email: user.email,
             password: new_password,
             password_confirmation: new_password,
             roles: ['company'])
      end

      it 'succeeds' do
        expect(context).to be_a_success
      end

      it 'returns user' do
        expect(context.user.id).to eq(user.id)
      end

      it 'updates user' do
        expect(context.user.roles).to eq(user.reload.roles)
      end
    end

    context 'when validate new user with invalid attributes' do
      let!(:other_user) { create(:user, :junior) }
      let(:user) { build(:user, :junior, email: other_user.email) }
      let(:params) { user.attributes.except(:crypted_password, :salt) }

      it 'fails' do
        expect(context).to be_a_failure
      end

      it 'not creates new user' do
        expect { context }.not_to change(User, :count)
      end

      it 'message validation error' do
        expect(context.message).to match(/уже существует/)
      end
    end

    context 'when validate existed user with invalid attributes' do
      let(:user) { create(:user, :junior) }
      let(:params) { user.attributes.except(:crypted_password, :salt).merge(email: 'wrongemail') }

      it 'fails' do
        expect(context).to be_a_failure
      end

      it 'not updates user' do
        expect(context.user).not_to be_valid
      end

      it 'message validation error' do
        expect(context.message).to match(/имеет неверное значение/)
      end
    end
  end
end
