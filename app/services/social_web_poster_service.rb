class SocialWebsPoster

  def post_job(job_id)
  VkWorker.perform_async(job_id)
  FbWorker.perform_async(job_id)
  TelegramWorker.perform_async(job_id)
  end
end
