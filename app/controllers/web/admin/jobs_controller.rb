# frozen_string_literal: true

# Controller for handling jobs in admin namespace.
module Web
  module Admin
    class JobsController < Web::Admin::BaseController
      before_action :load_job, except: %i[index]
      before_action :load_jobs, only: %i[index]

      def index
        @jobs = JobDecorator.decorate_collection(@jobs)
      end

      def edit; end

      def update
        if @job.update(job_params)
          redirect_to admin_jobs_path, notice: t('common.jobs.update.success')
        else
          redirect_to edit_admin_job_path(@job), alert: t('common.jobs.create.fail', @job.errors.messages.first)
        end
      end

      def destroy
        @job.destroy
        redirect_to admin_jobs_path, notice: t('admin.jobs.destroy.success')
      end

      def approve
        if @job.approve!
          redirect_to admin_jobs_path(show_status: 'not_approved'), notice: t('admin.jobs.approve.success')
        else
          redirect_to admin_jobs_path(show_status: 'not_approved'), alert: t('admin.jobs.approve.fail')
        end
      end

      def not_approve
        if @job.not_approve!
          redirect_to admin_jobs_path(show_status: 'approved'), notice: t('admin.jobs.not_approve.success')
        else
          redirect_to admin_jobs_path(show_status: 'approved'), alert: t('admin.jobs.not_approve.fail')
        end
      end

      private

      def load_job
        @job = Job.find(params[:id])
      end

      def load_jobs
        return @jobs = Job.where(status: params[:show_status]) if params[:show_status]
        @jobs = Job.order(:status)
      end

      def job_params
        params.require(:job).permit(
          :id, :status, :show_status,
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
end
