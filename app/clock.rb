require 'clockwork'
require 'sidekiq'
require 'gibbon'
require 'dotenv'

Dotenv.load(Rails.root.join('config', 'mailchimp.env'))

class MailerWorker
  include Clockwork
  include Sidekiq::Worker

  def perform(*args)
    gibbon = Gibbon::Request.new
    emails = Subscribe.all.pluck(:email)
    subscribers = gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members.retrieve
    emails.each do |email|
      gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members.create(body: { email_address: email, status: "subscribed" })
    end
    create_campaign_request = {
      type: "plaintext",
      recipients: {
        list_id: ENV['MAILCHIMP_LIST_ID'],
      },
      settings: {
        subject_line: 'Email Subject',
        title: 'Newsletter',
        from_name: 'Howtohireme',
        reply_to: 'office@howtohireme.ru',
      }
    }
    gibbon = MailList::GibbonApi.new
    gibbon.api.campaigns.create(body: create_campaign_request)
    email_body = { content: 'Test' }
    gibbon.api.campaigns(campaign_id_from_create_results).content.upsert(body: email_body)
  end

  every(1.day, 'mailer.job') { MailerWorker.perform_async }
end