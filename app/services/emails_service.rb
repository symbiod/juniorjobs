# frozen_string_literal: true

require 'gibbon'
require 'singleton'

# Gets the current mailing list from mailchimp
class EmailsService
  include Singleton

  def self.all_emails
    gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_ACCESS_KEY_ID'])
    gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members
  end
end
