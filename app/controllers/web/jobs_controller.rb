# frozen_string_literal: true

module Web
  class JobsController < BaseController
    before_action :load_job, only: %i[show edit update]
    before_action :check_token, only: %i[edit update]

    def show; end

    def new
      @job = Job.new
    end

    def create
      @job = CreateJob.new.call(current_user, job_params)

      if @job.save
        redirect_to job_path(@job), notice: t('common.jobs.create.success')
      else
        render :new, alert: t('common.jobs.create.fail')
      end
    end

    def edit; end

    def update
      if @job.update(job_params.merge(status: false))
        redirect_to job_path(@job), notice: t('common.jobs.update.success')
      else
        redirect_to edit_job_path(@job), alert: t('common.jobs.create.fail', @job.errors.messages[:description].first)
      end
    end

    private

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
        :token
      )
    end
  end
end
