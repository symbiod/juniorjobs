# frozen_string_literal: true

require 'gibbon'
require 'singleton'

class EmailsService
  include Singleton

  def connection
    gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_ACCESS_KEY_ID'])
    gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members
  end
end
