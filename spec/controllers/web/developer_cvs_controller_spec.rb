# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::DeveloperCvsController, type: :controller do
  describe 'GET #index' do
    let(:user) { create(:user, :junior) }
    let(:cv1) { create(:cv, user_id: user.id) }
    let(:cv2) { create(:cv, user_id: user.id) }

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
    let(:user) { create(:user, :junior) }
    let(:cv) { create(:cv, user_id: user.id) }
    before { get :show, params: { id: cv.id, user_id: user.id } }

    it { is_expected.to render_template :show }
  end
end
