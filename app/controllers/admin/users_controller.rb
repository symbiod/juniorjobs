# frozen_string_literal: true

module Admin
  # Controller for handling users in admin namespace.
  class UsersController < BaseController
    before_action :load_user, only: %i[edit update destroy]
    before_action :roles, only: %i[edit update]

    def index
      @users = User.all
    end

    def edit; end

    def update
      if @user.update(validated_params)
        redirect_to(admin_users_path, notice: t('admin.users.update.update_success'))
      else
        flash[:alert] = t('admin.users.update.update_fail', errors: @user.errors.full_messages)
        render :edit
      end
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path, notice: t('admin.users.destroy.success')
    end

    private

    def validated_params
      valid_params = UserSchema.with(valid_roles: @roles).call(user_params.to_h)
      valid_params.output
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, roles: [])
    end

    def load_user
      @user = User.find(params[:id])
    end

    def roles
      @roles = Settings.valid_roles
    end
  end
end
