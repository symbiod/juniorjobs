# frozen_string_literal: true

require 'clockwork'
require_relative '../config/boot'
require_relative '../config/environment'
require_relative '../config/sidekiq'

# Periodically synchronizes the mailing list with mailchimp
module Clockwork
  every(1.day, 'sync_emails.job') { SyncSubscribersJob.perform_later }
end
