class EventsController < ApplicationController
  def index
    @events = EventCreator.create_events(params)
  end

  def show
  end

end
