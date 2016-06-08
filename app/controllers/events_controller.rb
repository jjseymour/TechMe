class EventsController < ApplicationController
  def index
    @events = EventCreator.create_events(params)
    fresh_when etag: @jobs
  end

  def show
  end

  def create
    binding.pry
    @event = Event.new(event_params)
    if @event.save
      binding.pry
      render json: {
        success: true,
        eventID: params[:event_id]
      }
    else
      binding.pry
      render json: {
        success: false,
        eventID: params[:event_id]
      }
    end
  end

  private

  def event_params
    params.permit(:event_name, :event_city, :event_description, :event_rsvp)
  end
end
