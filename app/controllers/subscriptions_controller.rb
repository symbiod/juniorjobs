class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)
    flash[:notice] = @subscription.save ? t(:succesfully_subscribed_with, email: @subscription.email) : "#{t(:email)} #{@subscription.errors.messages[:email].join(', ')}."
    redirect_to contact_us_path
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