class EditJobMailer < ApplicationMailer
  default from: "office@howtohireme.ru"

  def edit_job_email(id)
    @job = Job.find(id)
    @user = @job.user
    mail(to: @user.email, subject: t('.you_created_the_job_on_juniorjobs')) do |format|
      format.text
      format.html
    end
  end
end
