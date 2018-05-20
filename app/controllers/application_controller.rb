# frozen_string_literal: true

# Common controller for all controllers in the project.
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  private

  def not_found
    redirect_to root_path, alert: ''
  end
end
