class EventCreator

  def self.create_events(params)
    Event.get_events(params["location"], params["language_selected"]).flatten
  end

end