# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::Auth::UsersController, type: :controller do
  describe 'POST #create' do
    subject { post 'create', params: params }
    let(:default_attributes) { attributes_for(:user, :company) }

    context 'register new user with correct params' do
      let(:params) { { user: { email: 'email@mail.com', password: 'qwerty', password_confirmation: 'qwerty', roles: 'junior' } } }

      it 'saves new user to database' do
        expect { subject }.to change(User.all, :count).by(1)
      end

      it 'redirects to main page' do
        is_expected.to redirect_to(root_path)
      end

      it 'user auto login' do
        post 'create', params: params
        expect(logged_in?).to eq true
      end
    end

    context 'register with incorrect attributes' do
      let(:params) { Hash(user: attributes_for(:user, :company).except(:crypted_password, :salt, :roles)) }

      it 'not save new user to database' do
        expect { subject }.not_to change(User.all, :count)
      end

      it 'redirects to main page' do
        is_expected.to render_template(:new)
      end

      it 'user not login' do
        post 'create', params: params
        expect(logged_in?).to eq false
      end
    end
  end

  describe 'PUT #update' do
    context 'update user with correct params' do
      let(:user) { create(:user, :junior) }
      let(:new_password) { 'newpassword' }
      let(:params) do
        Hash(id: user.id, user: { email: user.email,
                                  password: new_password,
                                  password_confirmation: new_password,
                                  roles: ['company'] })
      end

      before do
        login_user(user)
        put 'update', params: params
      end

      it 'updates user password' do
        expect(user.reload.valid_password?(new_password)).to eq true
      end

      it 'updates user role' do
        expect(user.reload.roles).to eq(['company'])
      end

      it 'redirects to main page' do
        is_expected.to redirect_to(root_path)
      end

      it 'user auto login after update' do
        expect(logged_in?).to eq true
      end
    end

    context 'update user with incorrect attributes' do
      let(:user) { create(:user, :junior) }
      let(:params) do
        Hash(id: user.id, user: { email: user.email,
                                  password: 'newpassword',
                                  password_confirmation: 'newpassword2',
                                  roles: [] })
      end

      before do
        login_user(user)
        put 'update', params: params
      end

      it 'not updates user password' do
        expect(user.reload.valid_password?('newpassword')).to eq false
      end

      it 'not updates user role' do
        expect(user.reload.roles).to eq(['junior'])
      end

      it { is_expected.to render_template(:edit) }
    end

    context 'other user cant edit profile' do
      let(:user) { create(:user, :junior) }
      let(:other_user) { create(:user, :junior) }
      let(:new_password) { 'newpassword' }
      let(:params) do
        Hash(id: user.id, user: { email: user.email,
                                  password: new_password,
                                  password_confirmation: new_password,
                                  roles: ['company'] })
      end

      before do
        login_user(other_user)
        put 'update', params: params
      end

      it 'not updates user password' do
        expect(user.reload.valid_password?('newpassword')).to eq false
      end

      it 'not updates user role' do
        expect(user.reload.roles).to eq(['junior'])
      end
    end

    context 'user cannot upgrade own profile to admin' do
      let(:user) { create(:user, :junior) }
      let(:params) do
        Hash(id: user.id, user: { email: user.email,
                                  password: 'secret',
                                  password_confirmation: 'secret',
                                  roles: ['admin'] })
      end

      before do
        login_user(user)
        put 'update', params: params
      end

      it 'not updates user role' do
        expect(user.reload.roles).not_to eq(['admin'])
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'user delete own profile' do
      let(:user) { create(:user, :company) }

      before do
        login_user(user)
        delete 'destroy', params: { id: user.id }
      end

      it 'delete user' do
        expect(User.exists?(user.id)).to eq false
      end

      it 'redirects to main page' do
        is_expected.to redirect_to root_path
      end
    end

    context 'other user cant delete profile' do
      let(:user) { create(:user, :company) }
      let(:other_user) { create(:user, :junior) }

      before do
        login_user(other_user)
        delete 'destroy', params: { id: user.id }
      end

      it 'not delete user' do
        expect(User.exists?(user.id)).to eq true
      end
    end
  end
end
