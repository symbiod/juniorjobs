# frozen_string_literal: true

# Controller for handling jobs in admin namespace.
module Web
  module Admin
    class JobsController < Web::Admin::BaseController
      before_action :load_job, except: %i[index]

      def index
        @jobs = Job.status(params[:show_status]).decorate
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
        message = @job.approve! ? localized_notice(:approved) : localized_alert(:approved)
        redirect_to admin_jobs_path(show_status: 'not_approved'), message
      end

      def not_approve
        message = @job.not_approve! ? localized_notice(:not_approved) : localized_alert(:not_approved)
        redirect_to admin_jobs_path(show_status: 'approved'), message
      end

      private

      def load_job
        @job = Job.find(params[:id]).decorate
      end

      def job_params
        params.require(:job).permit(
          :id, :status, :show_status, :title, :description, :requirements,
          :employment, :city, :country, :remote, :currency, :salary_from,
          :salary_to, :salary_by_agreement, :company_contact, :company_email,
          :company_name, :company_page, :company_phone, :expired_at, :token
        )
      end

      def localized_notice(locale)
        { notice: t("admin.jobs.#{locale}.success") }
      end

      def localized_alert(locale)
        { alert: t("admin.jobs.#{locale}.fail") }
      end

      def show_status_params
        params[:show_status]
      end
    end
  end
end
