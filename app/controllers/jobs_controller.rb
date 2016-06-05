class JobsController < ApplicationController
  def index
    @jobs = Job.get_jobs
  end

  def show
  end
end
