# frozen_string_literal: true

# Synchronization status of subscribed users with mailchimp subscription list
class SyncSubscribersJob < ApplicationJob
  queue_as :default

  def perform(all_emails = EmailsService.all_emails)
    offset = 0
    loop do
      emails = UnsubscribedUsersService.call(all_emails, offset)
      break unless emails.count.positive?
      offset += Settings.emails_offset
    end
  end
end
