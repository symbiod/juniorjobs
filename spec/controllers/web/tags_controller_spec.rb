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
end
