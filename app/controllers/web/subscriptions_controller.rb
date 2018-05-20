# coding: utf-8
# frozen_string_literal: true

module Web
  # Controller responsible for create email subscriptions for
  # receive emails with new jobs
  class SubscriptionsController < BaseController
    def create
      subscription = Subscription.new(subscription_params)

      if subscription.save
        SubscriptionMailer.creation_email(subscription.email).deliver_now
        flash[:notice] = t('subscription.subscribe')
      else
        flash[:alert] = t('subscription.exists')
      end

      redirect_to root_path
    end

    def destroy
      @subscription = Subscription.find_by(subscription_params[:email])
      SubscriptionMailer.destroy_email(@subscription.email).deliver_now
      @subscription.destroy
      redirect_to root_path, notice: t('subscription.unsubscribe')
    end

    private

    def subscription_params
      params.require(:subscription).permit(:email, :active)
    end
  end
end
