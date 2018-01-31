# frozen_string_literal: true

# Synchronization status of subscribed users with mailchimp subscription list
class SyncNewsletterSubscribersJob < ApplicationJob
  queue_as :default

  def perform
    offset = 0
    loop do
      emails = UnsubscribedUsersService.call(offset)
      break unless emails.count.positive?
      offset += Settings.emails_offset
    end
  end
end
