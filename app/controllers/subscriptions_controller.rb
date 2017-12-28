class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)
    flash[:notice] = @subscription.save ? t(:Succesfully_subscribed_with, email: @subscription.email) : "#{t(:Email)} #{@subscription.errors.messages[:email].join(', ')}."
    redirect_to root_path
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
  end

  private

  def subscription_params
    params.require(:subscription).permit(:email).merge(user_id: current_user&.id)
  end
end
