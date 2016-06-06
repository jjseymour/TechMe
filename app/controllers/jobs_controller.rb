class JobsController < ApplicationController
  def index
    @jobs = Job.get_jobs(g_format(params["location"]), params["time"], params["language_selected"]).flatten
  end

  def show
  end

  def create
  end

  private

  def g_format(location)
    location.downcase.split.join("+")
  end
end
