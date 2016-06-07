class Job < ApplicationRecord
  has_many :user_jobs
  has_many :users, through: :user_jobs

  belongs_to :language
  # validates :title, uniqueness: true

  def self.get_jobs(location, time, languages)
    jobs = []

    # GlassDoor API
    # languages.each do |language|
    #   jobs << json_format(glassdoor_call(location, time, language))
    # end

    # GitHub API
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

  def self.glassdoor_call(location, time, language)
    JSON.parse(RestClient.get("http://api.glassdoor.com/api/api.htm?t.p=#{ENV["glassdoor_partner_id"]}&t.k=#{ENV["glassdoor_key"]}&userip=#{ip}&useragent=Chrome&format=json&v=1&action=jobs-stats&l=#{location}&fromAge=#{time}&radius=2&jc=29&q=#{language}&returnJobTitles=true&returnEmployers=true&admLevelRequested=1"))
  end

  def self.ip
    `curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'`.chomp
  end
end
