module Web
  # TODO: documentation is missing for this class
  # We should consider addig some documentation here
  class DeveloperCvsController < BaseController
    def index
      @user = current_user
      @cvs = Cv.where(status: true).order('updated_at').page(params[:page]).per(6)
    end

    def show
      @cv = Cv.find(params[:id])
    end
  end
end
