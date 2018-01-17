class SocialWebPosterService

  def post_job(job_id)
  VkontakteWorker.perform_async(job_id)
  FacebookWorker.perform_async(job_id)
  TelegramWorker.perform_async(job_id)
  TwitterWorker.perform_async(job_id)
  end
end
