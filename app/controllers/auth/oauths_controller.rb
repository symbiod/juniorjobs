# frozen_string_literal: true

module Auth
  class OauthsController < BaseController
    skip_before_action :require_login, raise: false
    before_action :load_user_from_provider, only: %i[callback]

    def oauth
      login_at(provider)
    end

    def callback
      if @user
        redirect_to root_path, notice: t('.notice', provider: provider.titleize)
      else
        create_user
      end
    end

    private

    def create_user
      login_provider_user
      redirect_to root_path, notice: t('.notice', provider: provider.titleize)
    rescue StandardError => e
      Rails.logger.error(e)
      redirect_to root_path, alert: t('.alert', error: e.message)
    end

    def auth_params
      params.permit(:code, :provider)
    end

    def provider
      auth_params[:provider]
    end

    def load_user_from_provider
      @user = login_from(provider)
    end

    def login_provider_user
      @user = create_from(provider) { |user| user.roles = ['junior'] }
      reset_session
      auto_login(@user)
    end
  end
end
