# frozen_string_literal: true

module Web
  # TODO: documentation is missing for this class
  # We should consider addig some documentation here
  class DeveloperCvsController < BaseController
    def index
      @user = current_user
      @cvs = Cv.where(status: true).order('updated_at').page(params[:page]).per(6)
    end

    def show
      @cv = load_cv
    end

    private

    def load_cv
      @cv = Cv.cvs.find(params[:id])
    end
  end
end
