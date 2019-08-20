# frozen_string_literal: true

class CreateSubscription
  # def self.call(current_user, params)
  #   subscription = current_user ? current_user.build_subscription(params) : Subscription.new(params)
  #   EmailDispatchesJob.perform_later(params[:email]) if subscription.valid?
  #   subscription
  # end
end
