# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Auth::CvsController, type: :controller do
  describe '#index' do
    let(:user) { create(:user, :junior) }
    let(:cv) { create(:cv, user_id: user.id) }
    before { login_user(user) }

    it 'with logined user' do
      get :index, params: { user_id: user.id }
      expect(response).to render_template :index
    end

    it 'without user' do
<<<<<<< HEAD
      expect { get :index }.to raise_error(ActionController::UrlGenerationError)
=======
      expect{ get :index }.to raise_error(ActionController::UrlGenerationError)
>>>>>>> Add specs
    end
  end

  describe 'POST #create' do
    context 'with valid attributes and registered user' do
      let(:user) { create(:user, :junior) }
      before { login_user(user) }
      subject { post :create, params: { user_id: user.id, cv: attributes_for(:cv) } }

      it 'saves the new cv to database' do
        expect { subject }.to change(Cv.all, :count).by(1)
      end

      it 'redirects to show view' do
        expect(subject).to redirect_to(developer_path(assigns(:cv)))
      end
    end

    context 'with invalid attributes' do
      let(:user) { create(:user, :junior) }
      before { login_user(user) }
      subject { post :create, params: { user_id: user.id, cv: attributes_for(:cv, :invalid) } }

      it 'does not save the cv' do
        expect { subject }.to_not change(Cv, :count)
      end

      it { is_expected.to render_template(:new) }
    end

    context 'with valid attributes and without user' do
<<<<<<< HEAD
      subject { post :create, params: { cv: attributes_for(:cv) } }

      it 'without user, with correct cv params' do
        expect { subject }.to raise_error(ActionController::UrlGenerationError)
=======
      it 'without user, with correct cv params' do
        expect{ post :create, params: { cv: attributes_for(:cv) } }.to raise_error(ActionController::UrlGenerationError)
>>>>>>> Add specs
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes and registered user' do
      let(:user) { create(:user, :junior) }
      let(:cv) { create(:cv, user_id: user.id) }
      before do
        login_user(user)
        put :update, params: { user_id: user.id, id: cv.id, cv: attributes_for(:cv, :changed) }
      end

      it 'updates cv by owner' do
        expect(cv.reload.phone).to eq build(:cv, :changed, user_id: user.id).phone
      end

      it { is_expected.to redirect_to(developer_path(cv)) }
    end

    context 'updates cv with invalid attributes' do
      let(:user) { create(:user, :junior) }
      let(:cv) { create(:cv, user_id: user.id) }
      before do
        login_user(user)
        put :update, params: { user_id: user.id, id: cv.id, cv: attributes_for(:cv, :invalid) }
      end

      it 'does not update cv' do
        expect(cv.reload.description).to eq build(:cv, user_id: user.id).description
      end

      it { is_expected.to redirect_to(edit_user_cv_path(cv)) }
    end

    context 'not update cv by other user' do
      let(:user) { create(:user, :junior) }
      let(:user2) { create(:user, :junior) }
      let(:cv) { create(:cv, user_id: user.id) }
      before { login_user(user) }

      it 'does not update cv' do
        put :update, params: { user_id: user2.id, id: cv.id, cv: attributes_for(:cv) }
        expect(cv.reload.phone).to_not eq build(:cv, :changed, user_id: user.id).phone
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:user) { create(:user, :junior) }
    let(:cv) { create(:cv, user_id: user.id) }
    before do
      login_user(user, 'secret')
      delete 'destroy', params: { id: cv.id, user_id: user.id }
    end

    it 'redirects to main page' do
      is_expected.to redirect_to user_cvs_path
    end
  end
end
