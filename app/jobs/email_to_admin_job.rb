class EmailToAdminJob < ApplicationJob
  queue_as :default

  def perform(id)
    AdminJobMailer.delay.edit_job_email(id).deliver
  end
end
