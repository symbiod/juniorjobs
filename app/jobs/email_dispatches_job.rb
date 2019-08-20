# frozen_string_literal: true

require 'gibbon'

class EmailDispatchesJob < ApplicationJob
  # queue_as :default
  #
  # def perform(email)
  #   md5_email = Digest::MD5.hexdigest(email)
  #   gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_ACCESS_KEY_ID'])
  #   attrs = { body: { email_address: email, status: 'subscribed' } }
  #   gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members(md5_email.downcase).upsert(attrs)
  # end
end
