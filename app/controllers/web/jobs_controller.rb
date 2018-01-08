module Web
  class JobsController < BaseController
    before_action :load_job, only: %i[show edit update]

    def show; end

    def new
      @job = Job.new
    end

    def create
      @job = CreateJob.new.call(current_user, job_params)
      if @job
        redirect_to job_path(@job), notice: t('.success')
      else
        redirect_to edit_job_path(@job), alert: t('common.jobs.create.fail', @job.error.messages)
      end
    end

    def edit
      redirect_to job_path, notice: t('.incorrect_token') if @job.token != params[:token]
    end

    def update
      if @job.update(job_params)
        redirect_to job_path(@job), notice: t('.success')
      else
        render :edit
      end
    end

    private

    def load_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(
        :title,
        :description,
        :requirements,
        :employment,
        :city,
        :country,
        :remote,
        :currency,
        :salary_from,
        :salary_to,
        :salary_by_agreement,
        :company_contact,
        :company_email,
        :company_name,
        :company_page,
        :company_phone,
        :expired_at,
        :token
      )
    end
  end
end


# t.string "title", null: false
# t.text "description", null: false
# t.string "employment_type", null: false
# t.string "city"
# t.boolean "remote"
# t.string "currency"
# t.integer "salary_from"
# t.integer "salary_to"
# t.boolean "salary_by_agreement"
# t.text "requirements", null: false
# t.string "company_name"
# t.string "company_email"
# t.string "company_contact"
# t.string "company_page"
# t.string "company_phone"
# t.datetime "expired_at", null: false
