# frozen_string_literal: true

require 'rails_helper'

describe UnsubscribedUsersInteractor do
  let(:subscribed_user) { create(:user, :junior) }
  let(:unsubscribed_user) { create(:user, :junior) }
  let(:api_key) { '1234-us1' }
  let(:list_id) { 'testlist' }
  let(:member_id) { Digest::MD5.hexdigest(subscribed_user.email) }
  let(:token) { Base64.strict_encode64("apikey:#{api_key}").chomp }
  let(:url) { "https://us1.api.mailchimp.com/3.0/lists/#{list_id}/members" }

  it 'test request: subscribe with upsert' do
    body = { email_address: subscribed_user.email, status: 'subscribed' }
    headers = {
      'Accept' => '*/*',
      'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Authorization' => "Basic #{token}",
      'Content-Type' => 'application/json',
      'User-Agent' => 'Faraday v0.12.2'
    }
    stub_request(:put, "#{url}/#{member_id}")
      .with(body: body, headers: headers).to_return(status: 200, headers: {})
    Gibbon::Request.new(api_key: api_key).lists(list_id).members(member_id).upsert(body: body)
  end

  it 'test request: sync unsubscribed users' do
    headers = {
      'Accept' => '*/*',
      'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Authorization' => "Basic #{token}",
      'Content-Type' => 'application/json',
      'User-Agent' => 'Faraday v0.12.2'
    }
    params = {
      count: Settings.emails_offset,
      offset: 0,
      status: 'unsubscribed'
    }
    stub_request(:get, "#{url}?count=#{Settings.emails_offset}&offset=0&status=unsubscribed")
      .with(headers: headers).to_return(status: 200, headers: {})
    gibbon = Gibbon::Request.new(api_key: api_key).lists(list_id).members
    gibbon.retrieve(params: params)
  end
end
