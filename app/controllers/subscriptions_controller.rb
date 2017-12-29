class SubscriptionsController < ApplicationController
  before_action :load_recource, only: :destroy

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      flash[:notice] = t(:succesfully_subscribed_with, email: @subscription.email) 
    else
      flash[:notice] = "#{t(:email)} #{@subscription.errors.messages[:email].join(', ')}."
    end
    redirect_to root_path
  end

  def destroy
    @subscription.destroy
  end

  private

  def load_recource
    @subscription = Subscription.find(params[:id])
  end

  def subscription_params
    params.require(:subscription).permit(:email).merge(user_id: current_user&.id)
  end
end
