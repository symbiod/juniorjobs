# frozen_string_literal: true

module Web
  # JobsController responsible for operating with jobs and users
  # Send emails and create relation to user
  class JobsController < BaseController
    # before_action :load_job, only: %i[show edit update]

    def new
      @job = Job.new.decorate
    end

    # def create
    #   @job = Web::Jobs::CreateInteractor.call(params: job_params, user: current_user).model

    #   if @job.save
    #     Web::Mailers::JobService.call(@job.id)
    #     redirect_to job_path(@job), notice: t('common.jobs.create.success')
    #   else
    #     render :new, alert: t('common.jobs.create.fail')
    #   end
    # end

    # def show; end

    # def edit; end

    # def update
    #   if update_and_disapprove
    #     Web::Mailers::JobService.call(@job.id)
    #     redirect_to job_path(@job), notice: t('common.jobs.update.success')
    #   else
    #     redirect_to edit_job_path(@job), alert: t('common.jobs.create.fail')
    #   end
    # end

    # private

    # def validate_token
    #   redirect_to @job, notice: t('common.jobs.update.incorrect_token') unless valid_token?
    # end

    # def valid_token?
    #   @job.token == job_params[:token]
    # end

    # def load_job
    #   @job = Job.find(params[:id]).decorate
    # end

    # def update_and_disapprove
    #   @job.update(job_params) && @job.not_approve!
    # end

    # def job_params
    #   params.require(:job).permit(
    #     :id, :status, :title, :description, :requirements, :employment, :city, :country,
    #     :remote, :currency, :salary_from, :salary_to, :salary_by_agreement, :company_contact,
    #     :company_email, :company_name, :company_page, :company_phone, :expired_at, :token,
    #     :tag, :tag_list
    #   )
    # end
  end
end
