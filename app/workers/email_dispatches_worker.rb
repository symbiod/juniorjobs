require 'gibbon'

class EmailDispatchesWorker
  include Sidekiq::Worker

  def perform
    emails = Subscription.all.pluck(:email)
    gibbon = Gibbon::Request.new(api_key: ENV['ACCESS_KEY_ID'])
    emails.each do |email|
      md5_email = Digest::MD5.hexdigest(email)
      gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members(md5_email.downcase).upsert(body: { email_address: email, status: "subscribed" })
    end
  end
end