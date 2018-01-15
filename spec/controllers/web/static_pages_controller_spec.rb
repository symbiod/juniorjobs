require 'rails_helper'

RSpec.describe Web::StaticPagesController, type: :controller do
  describe '#about' do
    before { get :about }
    it { is_expected.to render_template(:about) }
  end

  describe '#terms' do
    before { get :terms }
    it { is_expected.to render_template(:terms) }
  end

  describe '#contact_us' do
    before { get :contact_us }
    it { is_expected.to render_template(:contact_us) }
  end
end