# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::WelcomeController, type: :controller do
  describe '#index' do
    context 'without tags params' do
      before { get :index }
      it { is_expected.to render_template(:index) }
    end

    context 'with tags params' do
      let(:job_with_tag) { create(:job, :approved) }

      before do
        job_with_tag.tag_list = 'java'
        job_with_tag.save
      end
      subject { get :index, params: { tag: 'java' } }
      job_list = Job.tagged_with('java')

      it { is_expected.to render_template(:jobs_with_tag) }
      it 'return job`s list with matched tag' do
        expect(job_list).to eq([job_with_tag])
      end
    end
  end
end
