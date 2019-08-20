# frozen_string_literal: true

require 'clockwork'
require_relative './boot'
require_relative './environment'
require_relative './sidekiq'

module Clockwork
  # every(1.day, 'sync_emails.job') { SyncSubscribersJob.perform_later }
  # every(1.week, 'load_contributors.job') { LoadContributorsJob.perform_later }
end
