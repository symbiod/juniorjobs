# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe Web::JobsController, type: :routing do
#   let(:job) { create(:job, :approved) }

#   describe '#new' do
#     subject { get new_job_path }

#     it { is_expected.to be_routable }
#     it { is_expected.to route_to(controller: 'web/jobs', action: 'new') }
#   end

#   describe '#create' do
#     subject { post jobs_path }

#     it { is_expected.to be_routable }
#     it { is_expected.to route_to(controller: 'web/jobs', action: 'create') }
#   end

#   describe '#show' do
#     subject { get job_path(id: job.id) }

#     it { is_expected.to be_routable }
#     it { is_expected.to route_to(controller: 'web/jobs', action: 'show', id: job.id.to_s) }
#   end

#   describe '#update' do
#     subject { put job_path(id: job.id) }

#     it { is_expected.to be_routable }
#     it { is_expected.to route_to(controller: 'web/jobs', action: 'update', id: job.id.to_s) }
#   end

#   describe '#destroy' do
#     subject { delete job_path(id: job.id) }

#     it { is_expected.to be_routable }
#     it { is_expected.to route_to(controller: 'web/jobs', action: 'destroy', id: job.id.to_s) }
#   end
# end
