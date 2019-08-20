# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  #
  # private
  #
  # def not_authorized
  #   redirect_back_or_to root_path, alert: t('auth.shared.athorize_alert')
  # end
  #
  # def not_authenticated
  #   redirect_to login_path, alert: t('auth.shared.login_alert')
  # end
end
