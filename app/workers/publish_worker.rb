class PublishWorker
  include Sidekiq::Worker

  def perform(job_id)
    VkWorker.perform_async(job_id)
 end
end
