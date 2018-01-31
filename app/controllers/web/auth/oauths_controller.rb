# frozen_string_literal: true

module Web
  module Auth
    # TODO: documentation is missing for this class
    # We should consider addig some documentation here
    class OauthsController < Web::Auth::BaseController
      skip_before_action :require_login, raise: false

      def oauth
        login_at(provider)
      end

      # TODO: Use interactors
      def callback
        @user = login_from(provider)
        create_user_from(provider) unless @user
        redirect_to root_path, notice: t('auth.oauths.callback.notice', provider: provider.titleize)
      rescue StandardError => error
        redirect_to root_path, alert: t('auth.oauths.callback.alert', error: error.message)
      end
      # TODO: Use interactors

      private

      def auth_params
        params.permit(:code, :provider)
      end

      def provider
        auth_params[:provider]
      end

      def create_user_from(provider)
        @user = create_from(provider) { |user| user.roles = ['junior'] }
        reset_session && auto_login(@user)
      end
    end
  end
end
