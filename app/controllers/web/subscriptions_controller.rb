module Web
  class SubscriptionsController < BaseController
    def new
      @subscription = Subscription.new
    end

    def create
      @subscription = current_user ? current_user.subscription.build(subscription_params) : Subscription.new(subscription_params)

      if @subscription.save
        flash[:notice] = t('common.success')
      else 
        flash[:alert] = @subscription.errors.messages[:email].first
      end

      redirect_to root_path
    end

    private

    def subscription_params
      params.require(:subscription).permit(:email)
    end
  end
end