# frozen_string_literal: true

module Web
  module Auth
    class UsersController < Web::Auth::BaseController
      # before_action :load_user, only: %i[edit update destroy]
      # before_action :load_roles, except: %i[destroy]
      # before_action :require_login, :authorize_user, only: %i[edit update destroy]
      #
      # def new
      #   @user = User.new
      # end
      #
      # # :reek:TooManyStatements
      # def create
      #   @result = Users::OrganizeInteractor.call(params: params, roles: @roles, user: @user)
      #
      #   if @result.success?
      #     auto_login(@result.user)
      #     redirect_back_or_to root_path, notice: t('auth.users.create.signup_success')
      #   else
      #     flash[:alert] = t('auth.users.create.signup_fail', errors: @result.message)
      #     @user = User.new
      #     render :new
      #   end
      # end
      #
      # def edit; end
      #
      # def update
      #   @result = Users::OrganizeInteractor.call(params: params, roles: @roles, user: @user)
      #   if @result.success?
      #     redirect_back_or_to root_path, notice: t('auth.users.update.update_success')
      #   else
      #     flash[:alert] = t('auth.users.update.update_fail', errors: @result.message)
      #     render :edit
      #   end
      # end
      #
      # def destroy
      #   @user.destroy
      #   redirect_to root_path, notice: t('auth.users.destroy.success')
      # end
      #
      # private
      #
      # def load_user
      #   @user = User.find(params[:id])
      # end
      #
      # def load_roles
      #   @roles = Settings.valid_roles - Settings.unpermitted_roles
      # end
      #
      # def authorize_user
      #   authorize @user
      # end
    end
  end
end
