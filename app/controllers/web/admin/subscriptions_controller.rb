# frozen_string_literal: true

# Controller for displaying subscriptions in admin namespace.
module Web
  module Admin
    class SubscriptionsController < Web::Admin::BaseController
      def index
        @subscriptions = Subscription.order(active: :desc).decorate
      end
    end
  end
end
