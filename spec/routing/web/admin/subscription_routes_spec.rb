# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes admin subscription controller', type: :routing do
  it 'routes a named route' do
    expect(get: admin_subscriptions_path).to route_to(controller: 'web/admin/subscriptions', action: 'index')
  end
end
