# frozen_string_literal: true

# Decorate methods for Subscription model. Example: @subscription = Subscription.find(1).decorate
class SubscriptionDecorator < ApplicationDecorator
  delegate_all

  def status
    object.active? ? t('decorators.subscription.active_status') : t('decorators.subscription.expired_status')
  end
end
