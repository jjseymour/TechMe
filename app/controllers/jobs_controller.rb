class JobsController < ApplicationController

  def index
    @jobs = JobCreator.create_jobs(params)
  end

  def show
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      @current_user.jobs << @job
      @current_user.save
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  def destroy
    binding.pry
    @job = Job.find_by(title: params[:title])
    @job.destroy
    render json: { success: true }
  end

  private

  def job_params
    params.permit(:title, :company, :location, :description, :position, :date_posted, :apply)
  end
end
