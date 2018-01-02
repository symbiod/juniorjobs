require 'clockwork'
require 'sidekiq'
include Clockwork

class MailerWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "It's alive!"
  end

  every(1.seconds, 'mailer.job') { MailerWorker.perform_async }
end