class CreateJob
  def call(current_user, job_params)
    job = current_user ? current_user.jobs.build(job_params) : Job.new(job_params)
    job.token = TokenGenerator.new.generate
    if job.save
      send_mail_to_admin(job)
      send_mail_to_author(job)
      job
    end
  end

  private

  def send_mail_to_admin(job)
    EmailToAdminJob.perform_later(job.id)
  end

  def send_mail_to_author(job)
    EmailToAuthorJob.perform_later(job.id)
  end
end