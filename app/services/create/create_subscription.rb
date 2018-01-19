# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
class CreateSubscription
  def call(current_user, params)
    subscription = current_user ? current_user.build_subscription(params) : Subscription.new(params)
    EmailDispatchesWorker.perform_async(params[:email]) if subscription.valid?
    subscription
  end
end
