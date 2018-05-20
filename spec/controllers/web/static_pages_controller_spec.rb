# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Web::StaticPagesController, type: :controller do
  render_views


  before do
    url = 'https://api.github.com/repos/howtohireme/juniorjobs/contributors?per_page=1000'
    headers = {
      'Accept'=>'application/vnd.github.v3+json',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Content-Type'=>'application/json',
      'User-Agent'=>'Octokit Ruby Gem 4.8.0'
    }
    stub_request(:get, url).with(headers: headers).to_return(status: 200, body: [], headers: {})
  end

  describe '#about' do
    before { get :about }

    include_examples 'meta_tags_specs'

    it { is_expected.to render_template(:about) }
    it 'should respond with a success status code (2xx)' do
      expect(response).to have_http_status(:success)
    end
  end

  describe '#terms' do
    before { get :terms }

    include_examples 'meta_tags_specs'

    it { is_expected.to render_template(:terms) }
    it 'should respond with a success status code (2xx)' do
      expect(response).to have_http_status(:success)
    end
  end

  describe '#contact_us' do
    before { get :contact_us }

    include_examples 'meta_tags_specs'

    it { is_expected.to render_template(:contact_us) }
    it 'should respond with a success status code (2xx)' do
      expect(response).to have_http_status(:success)
    end
  end
end
