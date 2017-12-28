class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.user_id = current_user if current_user
    flash[:notice] = @subscription.save ? "Succesfully subscribed with: #{ @subscription.email }" : "Email: #{ @subscription.errors.messages[:email].join(', ') }."
    redirect_to root_path
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
  end

  private

  def subscription_params
    params.require(:subscription).permit(:email)
  end
end
