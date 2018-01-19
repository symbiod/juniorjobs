# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
class EmailToAdminJob < ApplicationJob
  queue_as :default

  def perform(id)
    AdminJobMailer.edit_job_email(id).deliver_later
  end
end
