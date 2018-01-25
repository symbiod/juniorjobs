# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Admin::JobsController, type: :controller do
  describe 'GET #index' do
    subject do
      login_user(user)
      get :index
    end

    context 'admin can see jobs list' do
      let(:user) { create(:user, :admin) }

      it { is_expected.to render_template(:index) }
    end

    context 'non admin cant see jobs list in admin namespace' do
      let(:user) { create(:user, :junior) }

      it { is_expected.to have_http_status(:forbidden) }
    end
  end

  describe 'PUT #update' do
    context 'admin can update job without token' do
      let(:job) { create(:job) }
      let(:admin) { create(:user, :admin) }

      before do
        login_user(admin)
        put 'update', params: { id: job.id, job: attributes_for(:job, requirements: 'Работать') }
      end

      it 'updates job requirements' do
        expect(job.reload.requirements).to eq 'Работать'
      end

      it { is_expected.to redirect_to(admin_jobs_path) }
    end

    context 'user cannot update job in admin namespace' do
      let(:user) { create(:user, :company) }
      let(:job) { create(:job, user: user) }

      before do
        login_user(user)
        put 'update', params: { id: job.id, job: attributes_for(:job, requirements: 'Работать') }
      end

      it 'not updates job requirements' do
        expect(job.reload.requirements).to eq 'Работать много и пить кофе'
      end

      it 'show forbidden status' do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:job) { create(:job) }

    context 'admin can delete jobs' do
      let(:admin) { create(:user, :admin) }

      before do
        login_user(admin)
        delete 'destroy', params: { id: job.id }
      end

      it 'delete job' do
        expect(Job.exists?(job.id)).to eq false
      end

      it 'redirects to admin jobs page' do
        is_expected.to redirect_to admin_jobs_path
      end
    end

    context 'other user cannot delete jobs in admin namespace' do
      let(:user) { create(:user, :company) }

      before do
        login_user(user)
        delete 'destroy', params: { id: job.id }
      end

      it 'not delete job' do
        expect(Job.exists?(job.id)).to eq true
      end

      it 'show forbidden status' do
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
