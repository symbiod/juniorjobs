# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
class EditJobMailer < ApplicationMailer
  default from: Settings.email_from

  def edit_job_email(id)
    @job = Job.find(id)
    mail(to: @job.user.email, subject: t('common.jobs.create.you_created_the_job_on_juniorjobs'))
  end
end
