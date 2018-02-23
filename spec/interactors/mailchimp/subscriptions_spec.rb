# frozen_string_literal: true

require 'rails_helper'
require 'gibbon'

describe UnsubscribedUsersInteractor do
  let(:subscribed_user) { create(:user, :junior) }
  let(:unsubscribed_user) { create(:user, :junior) }
  let(:api_key) { '1234-us1' }
  let(:list_id) { 'testlist' }
  let(:member_id) { Digest::MD5.hexdigest(subscribed_user.email) }
  let(:subscription) { create(:subscription) }

  it 'subscribe with upsert request' do
    token = Base64.strict_encode64("apikey:#{api_key}").chomp
    body = { email_address: subscribed_user.email, status: 'subscribed' }
    stub_request(:put, "https://us1.api.mailchimp.com/3.0/lists/#{list_id}/members/#{member_id}")
      .with(
        body: body,
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization' => "Basic #{token}",
          'Content-Type' => 'application/json',
          'User-Agent' => 'Faraday v0.12.2'
        }
      )
      .to_return(status: 200, body: '', headers: {})
    Gibbon::Request.new(api_key: api_key).lists(list_id).members(member_id).upsert(body: body)
  end

  it 'sync unsubscribed users with db' do
    interactor = UnsubscribedUsersInteractor.call(emails: [subscription.email])
    expect(interactor).to be_a_success
  end

  it 'sync unsubscribed users with db if no unsubscribed users' do
    interactor = UnsubscribedUsersInteractor.call(emails: [])
    expect(interactor).to be_a_failure
  end
end
