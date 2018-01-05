module Web
  class SubscriptionsController < ApplicationController
    def new
      @subscription = Subscription.new
    end

    def create
      @subscription = Subscription.new(subscription_params)
      if @subscription.save
        flash[:notice] = success_subscription
      else 
        flash[:notice] = error_subscription
      end
      redirect_to contact_us_path
    end

    def destroy
      @subscription = Subscription.find(params[:id])
      @subscription.destroy
    end

    private

    def success_subscription
      t(:succesfully_subscribed_with, email: @subscription.email)
    end

    def error_subscription
      "#{t(:email)} #{@subscription.errors.messages[:email].join(', ')}."
    end

    def subscription_params
      params.require(:subscription).permit(:email).merge(user_id: current_user&.id)
    end
  end
end