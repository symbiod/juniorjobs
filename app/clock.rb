require 'clockwork'
require_relative "../config/boot"
require_relative "../config/environment"
require_relative '../config/sidekiq'

module Clockwork
  every(1.day, 'sending_emails.job') { EmailDispatchesWorker.perform_async }
end
