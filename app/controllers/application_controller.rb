# frozen_string_literal: true

# TODO: documentation is missing for this class
# We should consider addig some documentation here
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def not_authenticated
    redirect_to login_path, alert: t('auth.shared.login_alert')
  end
end
