# frozen_string_literal: true

module Web
  # TODO: documentation is missing for this class
  # lets add it
  class SubscriptionsController < BaseController
    def new
      @subscription = Subscription.new
    end

    # TODO: interactors
    def create
      @subscription = CreateSubscription.call(current_user, subscription_params)

      if @subscription.save
        flash[:notice] = t('common.success')
      else
        flash[:alert] = @subscription.errors.messages[:email].first
      end

      redirect_to root_path
    end
    # TODO: interactors

    private

    def subscription_params
      params.require(:subscription).permit(:email, :active)
    end
  end
end
