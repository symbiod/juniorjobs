# frozen_string_literal: true

module Admin
  # Controller for displaying subscriptions in admin namespace.
  class SubscriptionsController < BaseController
    def index
      @subscriptions = Subscription.order(active: :desc).decorate
    end
  end
end
