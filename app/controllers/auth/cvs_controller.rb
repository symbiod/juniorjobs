module Auth
  # This class adds possibility to add and handle Curriculum Vitae
  class CvsController < BaseController
    before_action :load_cv, only: [:show, :edit, :update, :destroy]

    def index
      @cvs = current_user.cvs.order('updated_at').page(params[:page]).per(6)
    end

    def new
      @cv = current_user.cvs.build
    end

    def create
      @cv = current_user.cvs.create(cv_params)
      if @cv.save
        redirect_to developer_cv_path(@cv), notice: t('common.cvs.create.success')
      else
        render :new, alert: t('common.cvs.create.fail')
      end
    end

    def edit; end

    def update
      if @cv.update(cv_params.merge(status: false))
        redirect_to developer_cv_path(@cv), notice: t('common.cvs.update.success')
      else
        error_msg = @cv.errors.messages[:description].first
        redirect_to edit_user_cv_path(@cv), alert: t('common.cvs.create.fail', error_msg)
      end
    end

    def destroy
      if @cv.destroy
        redirect_to root_path, notice: t('common.cvs.delete.success')
      else
        error_msg = @cv.errors.messages[:description].first
        redirect_back fallback_location: root_path, alert: t('common.cvs.delete.fail', error_msg)
      end
    end

    private

    def load_cv
      @cv = current_user.cvs.find(params[:id])
    end

    def cv_params
      params.require(:cv).permit(
        :id,
        :status,
        :title,
        :employment,
        :name,
        :description,
        :country, :city,
        :remote,
        :currency,
        :salary_from, :salary_to, :salary_by_agreement,
        :education, :skills, :work_experience,
        :expired_at,
        :address, :phone, :email, :web_site
        )
    end
  end
end
