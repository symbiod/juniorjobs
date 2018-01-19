# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
class CreateJob
  def call(current_user, job_params)
    job = current_user ? current_user.jobs.build(job_params) : Job.new(job_params)
    job.token = TokenGenerator.new.generate
    if job.valid?
      EmailToAdminJob.perform_later(job.id)
      EmailToAuthorJob.perform_later(job.id)
    end
    job
  end
end
