class EmailToAuthorJob < ApplicationJob
  queue_as :default

  def perform(id)
    EditJobMailer.edit_job_email(id).deliver_later
  end
end
