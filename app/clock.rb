require 'clockwork'
require_relative "../config/boot"
require_relative "../config/environment"
require_relative '../config/sidekiq'

module Clockwork
  every(1.day, 'sync_emails_subscribers.job') { SyncNewsletterSubscribersWorker.perform_async }
end
