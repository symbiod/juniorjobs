# frozen_string_literal: true

# Update job and makes it not approved
class UpdateJob
  def self.call(job, job_params)
    job.not_approve! if job.update(job_params)
  end
end
