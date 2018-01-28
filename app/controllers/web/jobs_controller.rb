# frozen_string_literal: true

module Web
  # TODO: documentation is missing for this class
  # We should consider addig some documentation here
  class JobsController < BaseController
    before_action :load_job, only: %i[show edit update]
    before_action :check_user, only: %i[edit update]

    def show; end

    def new
      @job = Job.new
    end

    # TODO: interactor
    def create
      @job = CreateJob.call(current_user, job_params)

      if @job.save
        EmailJobService.call(@job.id)
        redirect_to job_path(@job), notice: t('common.jobs.create.success')
      else
        render :new, alert: t('common.jobs.create.fail')
      end
    end
    # TODO: interactor

    def edit; end

    # TODO: interactor
    def update
      if UpdateJob.call(@job, job_params)
        EmailJobService.call(@job.id)
        redirect_to job_path(@job), notice: t('common.jobs.update.success')
      else
        redirect_to edit_job_path(@job), alert: t('common.jobs.create.fail', @job.errors.messages[:description].first)
      end
    end
    # TODO: interactor

    private

    def check_user
      if logged_in?
        authorize @job
      else
        check_token
      end
    end

    def check_token
      redirect_to @job, notice: t('common.jobs.update.incorrect_token') if @job.token != params[:job][:token]
    end

    def load_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(
        :id, :status,
        :title, :description,
        :requirements, :employment,
        :city, :country, :remote,
        :currency, :salary_from, :salary_to, :salary_by_agreement,
        :company_contact, :company_email, :company_name, :company_page, :company_phone,
        :expired_at,
        :token, :tag, tag_list: []
      )
    end
  end
end
