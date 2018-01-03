require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes and registered user' do
      let(:user) { create(:user, :company) }
      subject { post 'create', params: { job: attributes_for(:job).merge(user_id: user) }}

      it 'saves the new job to database' do
        expect { subject }.to change(Job.all, :count).by(1)
      end

      it 'redirects to show view' do
        expect(subject).to redirect_to(assigns(:job))
      end
    end

    context 'with valid attributes and without user' do
      subject { post 'create', params: { job: attributes_for(:job) }}

      it 'saves the new job to database' do
        expect { subject }.to change(Job.all, :count).by(1)
      end

      it 'redirects to show view' do
        expect(subject).to redirect_to(assigns(:job))
      end
    end

    context 'with invalid attributes' do
      subject { post 'create', params: { job: attributes_for(:job, :invalid) }}

      it 'does not save the job' do
        expect { subject }.to_not change(Job, :count)
      end

      it { is_expected.to render_template(:new) }
    end
  end

  describe '#show' do
    let(:job) { create(:job) }
    subject { get :show, params: { id: job.id }}

    it { is_expected.to render_template(:show) }
  end
end
