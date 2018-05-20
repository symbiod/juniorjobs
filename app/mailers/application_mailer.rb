# frozen_string_literal: true

# Keeps common mailer methods
class ApplicationMailer < ActionMailer::Base
  default from: Settings.contacts_email
  layout 'mailer'
end
