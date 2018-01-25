# frozen_string_literal: true

module Auth
  class UserSessionsController < BaseController
    before_action :load_user_session, only: %i[create]

    def new
      @user = User.new
    end

    def create
      if @user
        redirect_back_or_to root_path, notice: t('.success', email: @user.email)
      else
        flash.now[:alert] = t('.alert')
        render action: 'new'
      end
    end

    def destroy
      logout
      redirect_to root_path, notice: t('.logout')
    end

    private

    def session_params
      params.require(:user_session).permit(:email, :password)
    end

    def load_user_session
      @user = login(session_params[:email], session_params[:password])
    end
  end
end
