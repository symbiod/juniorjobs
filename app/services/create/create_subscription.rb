class CreateSubscription
  def call(current_user, email, subscription_params)
    subscription = current_user ? current_user.subscription.build(subscription_params) : Subscription.new(subscription_params)
    if subscription.valid?
      EmailDispatchesWorker.perform_async(email)
    end
    subscription
  end
end