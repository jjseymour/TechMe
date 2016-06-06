class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
  belongs_to :language

  def self.get_events(location, languages)
    events = []

    languages.each do |e|
      events << meetup_call(location, e)
    end
    events 
  end

  private

  def self.meetup_call(location, language)
    JSON.parse(RestClient.get("https://api.meetup.com/find/groups?key=#{ENV["meetup_app_key"]}&sign=true&photo-host=public&country=USA&location=New York&text=ruby &radius=5&fields=ruby&category=34&page=20"))
  end
end
