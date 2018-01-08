class EmailToAdminJob < ApplicationJob
  queue_as :default

  def perform(id)
    EditJobMailer.delay.edit_job_email(id).deliver
  end
end
