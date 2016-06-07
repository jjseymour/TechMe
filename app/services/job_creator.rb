class JobCreator

  def self.create_jobs(params)
    @jobs = Job.get_jobs(g_format(params["location"]), params["time"], params["language_selected"]).flatten
  end

  def self.g_format(location)
    location.downcase.split.join("+")
  end

end 