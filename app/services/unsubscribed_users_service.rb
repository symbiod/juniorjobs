# frozen_string_literal: true

# Take emails unsubscribed users from mailchimp list
class UnsubscribedUsersService
  def self.call(all_emails, offset)
    emails = all_emails.retrieve(attr_with(offset)).body['members'].pluck('email_address')
    Subscription.unsubscribe(emails) if emails.count.positive?
    emails
  end

  def self.attr_with(offset)
    {
      params: {
        count: Settings.emails_offset,
        offset: offset,
        status: 'unsubscribed'
      }
    }
  end
end
