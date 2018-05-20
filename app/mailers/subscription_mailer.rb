# frozen_string_literal: true

# Responsible for send mails about subscription status
class SubscriptionMailer < ApplicationMailer
  def creation_email(email)
    @email = email
    mail(to: email, subject: 'subscription.email.subscribe')
  end

  def destroy_email(email)
    @email = email
    mail(to: email, subject: 'subscription.email.unsubscribe')
  end
end
