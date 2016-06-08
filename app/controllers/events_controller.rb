class EventsController < ApplicationController
  def index
    @events = EventCreator.create_events(params)
    fresh_when etag: @jobs
  end

  def show
  end

end
