# frozen_string_literal: true

# Decorate methods for Subscription model.
class SubscriptionDecorator < ApplicationDecorator
  delegate_all

  # def status
  #   object.active? ? t('decorators.subscription.active_status') : t('decorators.subscription.expired_status')
  end
end
