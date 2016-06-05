class Job < ApplicationRecord
  has_many :user_jobs
  has_many :users, through: :user_jobs

  belongs_to :language

  def self.get_jobs(location, time, languages)
    languages.each do |language|
      glassdoor_call(location, time, language)
    end
    glassdoor_call["response"]
  end

  private
  def self.glassdoor_call(location, time, language)
    JSON.parse(RestClient.get("http://api.glassdoor.com/api/api.htm?t.p=#{ENV["glassdoor_partner_id"]}&t.k=#{ENV["glassdoor_key"]}&userip=#{ip}&useragent=Chrome&format=json&v=1&action=jobs-stats&l=#{location}&fromAge=#{time}&radius=2&jc=29&q=#{language}&returnJobTitles=true&returnEmployers=true&admLevelRequested=1"))
  end

  def self.ip
    `curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'`.chomp
  end
end
