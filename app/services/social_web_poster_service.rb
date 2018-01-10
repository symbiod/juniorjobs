# frozen_string_literal: true

# Service for start all publish workers
class SocialWebPosterService
  def post_job(job_id)
    VkontakteWorker.perform_async(job_id)
    FacebookWorker.perform_async(job_id)
    TelegramWorker.perform_async(job_id)
    TwitterWorker.perform_async(job_id)
  end
end
class SocialWebsPoster

  def post_job(job_id)
  VkWorker.perform_async(job_id)
  FbWorker.perform_async(job_id)
  TelegramWorker.perform_async(job_id)
  end
end
