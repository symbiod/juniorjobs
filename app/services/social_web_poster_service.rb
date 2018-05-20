# # frozen_string_literal: true

# # Service for start all jobs for pubslish
# class SocialWebPosterService
#   def self.post_job(job_id)
#     Socials::VkontaktePostJob.perform_later(job_id)
#     Socials::FacebookPostJob.perform_later(job_id)
#     Socials::TelegramPostJob.perform_later(job_id)
#     Socials::TwitterPostJob.perform_later(job_id)
#   end
# end
