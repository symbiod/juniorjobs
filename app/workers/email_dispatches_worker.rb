require 'gibbon'

class EmailDispatchesWorker
  include Sidekiq::Worker

  def perform(email)
    md5_email = Digest::MD5.hexdigest(email)
    gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members(md5_email.downcase).upsert(body: { email_address: email, status: "subscribed" })
  end
end