# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
class SyncNewsletterSubscribersWorker
  include Sidekiq::Worker

  def perform
    offset = 0
    emails = user_emails(offset.to_s)
    while emails.count.positive?
      unsubscribe(emails)
      offset += 500
      emails = user_emails(offset.to_s)
    end
  end

  def user_emails(offset)
    gibbon = Gibbon::Request.new(api_key: ENV['ACCESS_KEY_ID'])
    gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members.retrieve(params: { "count": '500', "offset": offset, "status": 'unsubscribed' }).body['members'].pluck('email_address')
  end

  def unsubscribe(emails)
    Subscription.where(email: emails).update_all(active: false)
  end
end
