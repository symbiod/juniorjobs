# frozen_string_literal: true

module Web
  module Auth
    # TODO: documentation is missing for this class
    # We should consider addig some documentation here
    class UserSessionsController < Web::Auth::BaseController
      before_action :load_user, only: %i[create]

      def new
        @user = User.new
      end

      def create
        if @user
          redirect_back_or_to root_path, notice: t('auth.user_sessions.create.success', email: @user.email)
        else
          flash.now[:alert] = t('auth.user_sessions.create.alert')
          render :new
        end
      end

      def destroy
        logout
        redirect_to root_path, notice: t('auth.user_sessions.destroy.logout')
      end

      private

      def load_user
        @user = login(session_params[:email], session_params[:password])
      end

      def session_params
        params.require(:user_session).permit(:email, :password)
      end
    end
  end
end
