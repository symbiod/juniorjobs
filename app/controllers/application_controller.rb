# frozen_string_literal: true

# Common controller for all controllers in the project.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private

  def not_authorized
    redirect_back_or_to root_path, alert: t('auth.shared.athorize_alert')
  end

  def not_authenticated
    redirect_to login_path, alert: t('auth.shared.login_alert')
  end
end
