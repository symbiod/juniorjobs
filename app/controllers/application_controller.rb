# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Concerns::ErrorsHandlers

  protect_from_forgery with: :exception
end
