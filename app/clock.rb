# frozen_string_literal: true

require 'clockwork'
require_relative '../config/boot'
require_relative '../config/environment'
require_relative '../config/sidekiq'

# TODO: documentation is missing for this class
# We should consider addig some documentation here
module Clockwork
  every(1.day, 'sync_emails_subscribers.job') { SyncNewsletterSubscribersJob.perform_later }
end
