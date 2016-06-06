class EventsController < ApplicationController
  def index
    @events = Event.get_events(params["location"], params["language_selected"]).flatten 
  end

  def show
  end
end
