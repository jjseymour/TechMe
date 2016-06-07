class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
  belongs_to :language

  def self.get_events(location, languages)
    events = []
    languages.each do |language| 
      events << meetup_call(location, language)
    end
    events 
  end

  private

  def self.meetup_call(location, language)
    JSON.parse(RestClient.get("https://api.meetup.com/find/groups?key=#{ENV["meetup_app_key"]}&sign=true&photo-host=public&country=USA&upcoming_events=true&location=#{location}&text=#{language}&radius=5&category=34&page=20"))
  end
end
