# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
class CreateSubscription
  def call(current_user, subscription_params)
    subscription = current_user ? current_user.build_subscription(subscription_params) : Subscription.new(subscription_params)
    EmailDispatchesWorker.perform_async(subscription_params[:email]) if subscription.valid?
    subscription
  end
end
