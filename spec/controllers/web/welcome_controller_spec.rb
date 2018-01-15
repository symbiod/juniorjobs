require 'rails_helper'

RSpec.describe Web::WelcomeController, type: :controller do
  describe '#index' do
    before { get :index }
    it { is_expected.to render_template(:index) }
  end
end