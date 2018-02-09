# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::TagsController, type: :controller do
  describe 'POST #index' do
    before { @tags = ActsAsTaggableOn::Tag.all }
    before { get 'index', params: { term: 'rub' } }
    it 'returns a successful 200 response' do
      get :index, format: :json
      expect(response).to be_success
    end
    it 'return all tags in json' do
      get 'index', params: { term: 'rub' }
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to eq(@tags.count)
    end
  end

  describe 'GET #show' do
    let(:job) { create(:job, :approved, :with_tag_list) }
    subject { get 'show', params: { id: 'java' } }
    job_list = Job.tagged_with('java')

    it { is_expected.to render_template(:jobs_with_tag) }
    it 'return job`s list with matched tag' do
      expect(job_list).to eq([job])
    end
  end
end
