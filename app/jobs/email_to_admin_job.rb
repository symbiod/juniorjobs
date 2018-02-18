# frozen_string_literal: true

# Send emails to admin after update job
class EmailToAdminJob < ApplicationJob
  queue_as :default

  def perform(id)
    AdminJobMailer.edit_job_email(id).deliver_later
  end
end
