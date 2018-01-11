module Web
  class SubscriptionsController < BaseController
    def new
      @subscription = Subscription.new
    end

    def create
      @subscription = CreateSubscription.new.call(current_user, params[:email], subscription_params)

      if @subscription.save
        flash[:notice] = t('common.success')
      else 
        flash[:alert] = @subscription.errors.messages[:email].first
      end

      redirect_to root_path
    end

    private

    def subscription_params
      params.require(:subscription).permit(:email, :active, :user_id)
    end
  end
end