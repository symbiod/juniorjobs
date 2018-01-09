module Auth
  class UsersController < BaseController
    before_action :load_user, only: %i[edit update destroy]
    before_action :load_roles, only: %i[new edit create update]
    before_action :require_login, only: %i[edit update destroy]

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        auto_login(@user)
        redirect_back_or_to(root_path, notice: t('.signup_success'))
      else
        flash[:alert] = t('.signup_fail', errors: @user.errors.full_messages)
        render :new
      end
    end

    def edit; end

    def update
      if @user.update(user_params)
        redirect_back_or_to(root_path, notice: t('.update_success'))
      else
        flash[:alert] = t('.update_fail', errors: @user.errors.full_messages)
        render :edit
      end
    end

    def destroy
      @user.destroy
      redirect_to root_path
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, roles: [])
    end

    def load_user
      @user = User.find(params[:id])
    end

    def load_roles
      @roles = User::VALID_ROLES - ['admin']
    end
  end
end
