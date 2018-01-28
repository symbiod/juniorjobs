# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
class SyncNewsletterSubscribersJob < ApplicationJob
  queue_as :default

  EMAILS_OFFSET = 500

  # TODO: Valentin
  # :reek:DuplicateMethodCall
  def perform
    offset = 0
    emails = user_emails(offset)

    while emails.count.positive?
      Subscription.unsubscribe(emails)
      offset += EMAILS_OFFSET
      emails = user_emails(offset)
    end
  end

  # TODO: move to utility / service
  def user_emails(offset)
    email_subscribers.retrieve(attributes_with(offset)).body['members'].pluck('email_address')
  end

  def email_subscribers
    # TODO: Don't create gibbon in loop every time, just once
    gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_ACCESS_KEY_ID'])
    gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members
  end

  def attributes_with(offset)
    {
      params: {
        count: EMAILS_OFFSET,
        offset: offset,
        status: 'unsubscribed'
      }
    }
  end
  # TODO: move to utility / service
end
