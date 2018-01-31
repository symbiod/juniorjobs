# frozen_string_literal: true

# Take emails unsubscribed users from mailchimp list
class UnsubscribedUsersService
  def self.call(offset)
    emails.retrieve(attr_with(offset)).body['members'].pluck('email_address')
    Subscription.unsubscribe(emails)
  end

  def self.emails
    gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_ACCESS_KEY_ID'])
    gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members
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
