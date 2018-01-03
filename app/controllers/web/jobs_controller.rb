module Web
  class JobsController < BaseController
    before_action :load_job, only: %i[show]

    def show; end

    def new
      @job = Job.new
    end

    def create
      @job = current_user ? current_user.jobs.build(job_params) : Job.new(job_params)
      if @job.save
        redirect_to job_path(@job), notice: t('.success')
      else
        render :new
      end
    end

    private

    def load_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(
        :status,
        :title,
        :description,
        :employment_type,
        :country,
        :city,
        :remote,
        :currency,
        :salary_from,
        :salary_to,
        :salary_by_agreement,
        :tasks,
        :requirements,
        :condition
      )
    end
  end
end
