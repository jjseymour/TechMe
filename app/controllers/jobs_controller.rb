class JobsController < ApplicationController

  def index
    @jobs = Job.get_jobs(g_format(params["location"]), params["time"], params["language_selected"]).flatten
  end

  def show
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  def destroy
    # binding.pry
    @job = Job.find_by(title: params[:title])
    @job.destroy
    render json: { success: true }
  end

  private

  def g_format(location)
    location.downcase.split.join("+")
  end

  def job_params
    params.permit(:title, :company, :location, :description, :position, :date_posted, :apply)
  end
end
