# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
