# frozen_string_literal: true

# Controller for displaying subscriptions in admin namespace.
module Web
  module Admin
    class SubscriptionsController < Web::Admin::BaseController
      before_action :load_subscription, only: %i[destroy]

      def index
        @subscriptions = Subscription.order(active: :desc).decorate
      end

      def destroy
        EmailDispatchesJob.perform_later(@subscription.email, 'unsubscribed')
        @subscription.destroy
        redirect_to admin_subscriptions_path, notice: t('web.admin.subscriptions.unsubscribe.success')
      end

      private

      def load_subscription
        @subscription = Subscription.find(params[:id])
      end
    end
  end
end
