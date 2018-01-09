class AdminJobMailer < ApplicationMailer
  default from: "office@howtohireme.ru"

  def edit_job_email(id)
    @job = Job.find(id)
    @user = @job.user
    mail(to: "office@howtohireme.ru", subject: t('common.jobs.create.job_was_created_and_needs_to_review')) do |format|
      format.text
      format.html
    end
  end
end