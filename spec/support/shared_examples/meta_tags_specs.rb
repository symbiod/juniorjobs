# frozen_string_literal: true

require 'rails_helper'

RSpec.shared_examples 'meta_tags_specs' do |namespace|
  it 'has meta description' do
    desc_tag = "meta[name=\"description\"][content=\"#{Settings.seo.description}\"]"
    expect(response.body).to have_css(desc_tag, visible: false)
  end

  it 'has meta keywords' do
    key_tag = "meta[name=\"keywords\"][content=\"#{Settings.seo.keywords}\"]"
    expect(response.body).to have_css(key_tag, visible: false)
  end
end
