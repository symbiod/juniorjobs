# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'routes admin job controller', type: :routing do
  let(:job) { create(:job) }

  it { expect(get: admin_jobs_path).to route_to(controller: 'web/admin/jobs', action: 'index') }

  it 'routes to edit path' do
    expect(get: edit_admin_job_path(job)).to route_to(controller: 'web/admin/jobs',
                                                      action: 'edit',
                                                      id: job.id.to_s)
  end

  it 'routes to update path' do
    expect(put: admin_job_path(job)).to route_to(controller: 'web/admin/jobs',
                                                 action: 'update',
                                                 id: job.id.to_s)
  end

  it 'routes to update path' do
    expect(patch: admin_job_path(job)).to route_to(controller: 'web/admin/jobs',
                                                   action: 'update',
                                                   id: job.id.to_s)
  end

  it 'routes to delete path' do
    expect(delete: admin_job_path(job)).to route_to(controller: 'web/admin/jobs',
                                                    action: 'destroy',
                                                    id: job.id.to_s)
  end

  it 'routes to approve job path' do
    expect(post: approve_admin_job_path(job)).to route_to(controller: 'web/admin/jobs',
                                                          action: 'approve',
                                                          id: job.id.to_s)
  end

  it 'routes to not approve job path' do
    expect(post: not_approve_admin_job_path(job)).to route_to(controller: 'web/admin/jobs',
                                                              action: 'not_approve',
                                                              id: job.id.to_s)
  end
end
