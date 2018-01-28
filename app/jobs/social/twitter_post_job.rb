# frozen_string_literal: true

# Job for publish post to twitter. (gem 'twitter')
class TwitterPostJob < BasePostJob
  def perform(job_id)
    super
    generate_url
    generate_message
    client.update(message)
  end

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
  end
end
