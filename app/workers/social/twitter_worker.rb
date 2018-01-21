# frozen_string_literal: true

# Worker for publish post to twitter. (gem 'twitter')
class TwitterWorker < BaseWorker
  include Sidekiq::Worker

  def perform(job_id)
    prepare_tw
    load_job(job_id)
    generate_url
    generate_message

    @client.update(@message)
  end

  def prepare_tw
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
  end
  class TwitterWorker <  BaseWorker
class TwitterWorker < BaseWorker
  include Sidekiq::Worker

  def perform(job_id)
    prepare_tw
    load_job(job_id)
    generate_url
    generate_message

    @client.update(@message)
end

  def prepare_tw
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
    end
end
