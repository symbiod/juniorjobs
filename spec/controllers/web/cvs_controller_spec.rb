# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::CvsController, type: :controller do
  describe 'GET #index' do
    let(:cv1) { create(:cv, :associated) }
    let(:cv2) { create(:cv, user_id: cv1.user.id) }

    it 'renders index view' do
      get :index
      expect(response).to render_template :index
    end

    it 'exists an array of cvs' do
      get :index
      expect(assigns(:cvs)).to match_array([cv1, cv2])
    end
  end

  describe 'GET #show' do
    let(:cv) { create(:cv, :associated) }
    before { get :show, params: { id: cv.id, user_id: cv.user.id } }

    it { is_expected.to render_template :show }
  end

  describe '#own' do
    let(:user) { create(:user, :junior) }
    subject { get :own }

    it 'with logined user' do
      login_user(user)
      expect(subject).to render_template :own
    end

    it 'without user' do
      expect(subject).to redirect_to login_path
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
        expect(subject).to redirect_to(cv_path(assigns(:cv)))
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
      subject { post :create, params: { cv: attributes_for(:cv) } }

      it 'without user, with correct cv params' do
        expect(subject).to redirect_to login_path
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes and registered user' do
      let(:cv) { create(:cv, :associated) }
      before do
        login_user(cv.user)
        put :update, params: { user_id: cv.user.id, id: cv.id, cv: attributes_for(:cv, :changed) }
      end

      it 'updates cv by owner' do
        expect(cv.reload.phone).to eq build(:cv, :changed, user_id: cv.user.id).phone
      end

      it { is_expected.to redirect_to(cv_path(cv)) }
    end

    context 'updates cv with invalid attributes' do
      let(:cv) { create(:cv, :associated) }
      before do
        login_user(cv.user)
        put :update, params: { user_id: cv.user.id, id: cv.id, cv: attributes_for(:cv, :invalid) }
      end

      it 'does not update cv' do
        expect(cv.reload.description).to eq build(:cv, user_id: cv.user.id).description
      end

      it { is_expected.to redirect_to(edit_cv_path(cv)) }
    end

    context 'not update cv by other user' do
      let(:cv1) { create(:cv, :associated) }
      let(:cv2) { create(:cv, :associated) }
      before { login_user(cv2.user) }

      it 'does not update cv' do
        put :update, params: { user_id: cv2.user.id, id: cv1.id, cv: attributes_for(:cv) }
        expect(cv1.reload.phone).to_not eq build(:cv, :changed, user_id: cv1.user.id).phone
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:cv) { create(:cv, :associated) }
    before do
      login_user(cv.user, 'secret')
      delete 'destroy', params: { id: cv.id, user_id: cv.user.id }
    end

    it 'redirects to main page' do
      is_expected.to redirect_to cvs_path
    end
  end
end
