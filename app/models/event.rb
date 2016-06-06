class Event < ApplicationRecord
  has_many :user_events
  has_many :users, through: :user_events
  belongs_to :language

  def self.meetup_call
    RestClient.get("https://api.meetup.com/find/groups?zip=10021")
  end
end
