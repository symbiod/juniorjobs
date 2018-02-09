# frozen_string_literal: true

require 'rails_helper'
require 'aasm/rspec'

RSpec.describe Web::Admin::JobsController, type: :controller do
  describe 'GET #index' do
    subject do
      login_user(user)
      get :index
    end

    context 'admin can see jobs list' do
      let(:user) { create(:user, :admin) }

      it { is_expected.to render_template(:index) }
      it { is_expected.to have_http_status(:success) }
    end

    context 'non admin cant see jobs list in admin namespace' do
      let(:user) { create(:user, :junior) }

      it { is_expected.to have_http_status(:forbidden) }
    end

    context 'anonym cant see jobs list in admin namespace' do
      it 'redirects to login path' do
        get :index
        expect(response).to redirect_to login_path
      end
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

      it 'redirects to admin jobs path' do
        expect(response).to redirect_to admin_jobs_path
      end
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

    context 'admin can approve job' do
      let(:job) { create(:job) }
      let(:admin) { create(:user, :admin) }

      before do
        login_user(admin)
        put 'approve', params: { id: job.id }
      end

      it 'admin approve job' do
        expect(job.reload.status).to eq 'approved'
      end
    end

    context 'admin can not_approve job' do
      let(:job) { create(:job, :approved) }
      let(:admin) { create(:user, :admin) }

      before do
        login_user(admin)
        put 'not_approve', params: { id: job.id }
      end

      it 'admin not_approve job' do
        expect(job.reload.status).to eq 'not_approved'
      end
    end

    context "user can't approve job" do
      let(:job) { create(:job) }
      let(:user) { create(:user, :company) }

      before do
        login_user(user)
        put 'approve', params: { id: job.id }
      end

      it 'user approve job' do
        expect(job.reload.status).to eq 'not_approved'
      end
    end

    context "user can't not_approve job" do
      let(:job) { create(:job, :approved) }
      let(:user) { create(:user, :company) }

      before do
        login_user(user)
        put 'not_approve', params: { id: job.id }
      end

      it 'user approve job' do
        expect(job.reload.status).to eq 'approved'
      end
    end

    context 'anonim cant edit jobs in admin namespace' do
      let(:job) { create(:job, :approved) }

      it 'redirects to login path' do
        put 'update', params: { id: job.id, job: attributes_for(:job, requirements: 'Работать') }
        expect(response).to redirect_to login_path
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
        expect(response).to redirect_to admin_jobs_path
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

    context 'anonym cant delete jobs in admin namespace' do
      it 'redirects to login path' do
        delete 'destroy', params: { id: job.id }
        expect(response).to redirect_to login_path
      end
    end
  end
end
