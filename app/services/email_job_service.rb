# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
class EmailJobService
  def self.call(id)
    EmailToAdminJob.perform_later(id)
    EmailToAuthorJob.perform_later(id)
  end
end
