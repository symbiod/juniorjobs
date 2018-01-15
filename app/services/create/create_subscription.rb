class CreateSubscription
  def call(current_user, subscription_params)
    subscription = current_user ? current_user.build_subscription(subscription_params) : Subscription.new(subscription_params)
    if subscription.valid?
      EmailDispatchesWorker.perform_async(subscription_params[:email])
    end
    subscription
  end
end
