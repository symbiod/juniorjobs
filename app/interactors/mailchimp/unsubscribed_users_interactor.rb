# frozen_string_literal: true

require 'gibbon'
# Take emails unsubscribed users from mailchimp list
class UnsubscribedUsersInteractor
  include Interactor

  def call
    if UnsubscribedUsersInteractor.unsubscribed_emails.count.positive?
      Subscription.unsubscribe(emails)
    else
      context.fail!
    end
  end

  def self.unsubscribed_emails(collected_emails = [], emails_offset = Settings.emails_offset)
    (0..1.0 / 0.0).step(emails_offset) do |offset|
      emails = EmailsService.all_emails.retrieve(params: attr_with(offset.to_i)).body['members']
      emails.count.positive? ? collected_emails << emails.pluck('email_address') : break
    end
    collected_emails.flatten
  end

  def self.attr_with(offset)
    {
      count: Settings.emails_offset,
      offset: offset,
      status: 'unsubscribed'
    }
  end
end
