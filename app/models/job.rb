class Job < ApplicationRecord
  has_many :user_jobs
  has_many :users, through: :user_jobs

  belongs_to :language
  # validates :title, uniqueness: true

  def self.get_jobs(location, time, languages)
    jobs = []

    languages.each do |language|
      jobs << format_sections(github_call(location, time, language))
    end
    jobs
  end

  def self.format_sections(json)
    json.each do |job|
      job["created_at"] = DateTime.parse(job["created_at"]).strftime("%A, %d %b %Y %l:%M %p")
    end
  end

  private

  def self.github_call(location, time, language)
    JSON.parse(RestClient.get("https://jobs.github.com/positions.json?description=#{language}&location=#{location}"))
  end

end
