class JobsController < ApplicationController
  def index
    @jobs = Job.get_jobs
  end

  def show
  end

  def create
    @location = g_format(params["location"])
    @time = params["time"]
    @languages = params["language_selected"]
    Job.get_jobs(@location, @time, @languages)
  end

  private

  def g_format(location)
    location.downcase.split.join("-")
  end
end
