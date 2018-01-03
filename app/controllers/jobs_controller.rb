class JobsController < ApplicationController
  before_action :set_job, only: %i[show]

  def show; end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  private

  def set_job
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
        :condition,
        :user_id)
  end
end
