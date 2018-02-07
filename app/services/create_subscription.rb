# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
class CreateSubscription
  def self.call(current_user, params)
    subscription = current_user ? current_user.build_subscription(params) : Subscription.new(params)
    EmailDispatchesJob.perform_later(params[:email], 'subscribed') if subscription.valid?
    subscription
  end
end
