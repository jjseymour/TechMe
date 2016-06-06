class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
  belongs_to :language

<<<<<<< HEAD
  def self.meetup_call
    RestClient.get("https://api.meetup.com/find/groups?zip=10021")
=======
  def self.get_events(location, languages)
    events = []
    languages.each do |language| 
      #language_name = Language.find_by(id: language).title
      events << meetup_call(location, language)
    end
    events 
  end

  private

  def self.meetup_call(location, language)
    JSON.parse(RestClient.get("https://api.meetup.com/find/groups?key=#{ENV["meetup_app_key"]}&sign=true&photo-host=public&country=USA&upcoming_events=true&location=#{location}&text=#{language}&radius=5&category=34&page=20"))
>>>>>>> d268fdf140f8f2eba0cca8e947ef70d402a31504
  end
end
