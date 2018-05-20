# frozen_string_literal: true

require 'clockwork'
require_relative '../config/boot'
require_relative '../config/environment'
require_relative '../config/sidekiq'

# Responsible for scheduled jobs
module Clockwork
  every(1.day, 'github.update_contributors.job') { Integrations::Github::UpdateContributorsJob.perform_later }
  # every(1.day, 'sync_emails.job') { SyncSubscribersJob.perform_later }
end
