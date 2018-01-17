  class TwitterWorker <  BaseWorker
  include Sidekiq::Worker


  def perform(job_id)
  client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["CONSUMER_KEY"]
  config.consumer_secret     = ENV["CONSUMER_SECRET"]

  config.access_token        = ENV["ACCESS_TOKEN"]
  config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
end
@job = Job.find_by(id: job_id)
client.update("Требуется: #{@job.title} (#{@job.city}, от #{@job.salary_from})
  http://juniorjobs.#{@job.country}/job/#{@job.id}")
end

end
