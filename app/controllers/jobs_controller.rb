class JobsController < ApplicationController

  def index
    @jobs = JobCreator.create_jobs(params)
    fresh_when etag: @jobs
  end

  def show
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      @current_user.jobs << @job
      render json: {
        success: true,
        jobId: params[:job_id]}
    else
      render json: { success: false }
    end
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.users.length > 1
      UserJob.find_by(job_id: params[:id]).destroy
      render json: {
        success: true,
        jobId: params[:job_id]
      }
    else
      UserJob.find_by(job_id: params[:id]).destroy
      @job.destroy
      render json: {
        success: true,
        jobId: params[:job_id] }
    end
  end

  private

  def job_params
    params.permit(:title, :company, :location, :description, :position, :date_posted, :apply)
  end
end
