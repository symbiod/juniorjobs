# frozen_string_literal: true

require 'gibbon'

# TODO: documentation is missing for this class
# We should consider addig some documentation here
class EmailDispatchesWorker
  include Sidekiq::Worker

  def perform(email)
    md5_email = Digest::MD5.hexdigest(email)
    gibbon = Gibbon::Request.new(api_key: ENV['ACCESS_KEY_ID'])
    attrs = { body: { email_address: email, status: 'subscribed' } }
    gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members(md5_email.downcase).upsert(attrs)
  end
end
