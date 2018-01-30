# frozen_string_literal: true

# Service for start all jobs for pubslish
class SocialWebPosterService
  def self.post_job(job_id)
    VkontaktePostJob.perform_later(job_id)
    FacebookPostJob.perform_later(job_id)
    TelegramPostJob.perform_later(job_id)
    TwitterPostJob.perform_later(job_id)
  end
end
