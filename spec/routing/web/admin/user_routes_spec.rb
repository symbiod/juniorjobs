# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes admin user controller', type: :routing do
  let(:user) { create(:user, :junior) }

  it { expect(get: admin_users_path).to route_to(controller: 'web/admin/users', action: 'index') }

  it 'routes to edit path' do
    expect(get: edit_admin_user_path(user)).to route_to(controller: 'web/admin/users',
                                                        action: 'edit',
                                                        id: user.id.to_s)
  end

  it 'routes to update path' do
    expect(put: admin_user_path(user)).to route_to(controller: 'web/admin/users',
                                                   action: 'update',
                                                   id: user.id.to_s)
  end

  it 'routes to update path' do
    expect(patch: admin_user_path(user)).to route_to(controller: 'web/admin/users',
                                                     action: 'update',
                                                     id: user.id.to_s)
  end

  it 'routes to delete path' do
    expect(delete: admin_user_path(user)).to route_to(controller: 'web/admin/users',
                                                      action: 'destroy',
                                                      id: user.id.to_s)
  end
end
