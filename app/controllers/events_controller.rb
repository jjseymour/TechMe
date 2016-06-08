class EventsController < ApplicationController
  def index
    @events = EventCreator.create_events(params)
    fresh_when etag: @jobs
  end

  def show
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      @current_user.events << @event
      render json: {
        success: true,
        eventID: params[:event_id]
      }
    else
      render json: {
        success: false,
        eventID: params[:event_id]
      }
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.users.length > 1
      UserEvent.find(params[:id]).destroy
      render json: {
        success: true,
        eventID: params[:event_id]
      }
    else
      UserEvent.find(params[:id]).destroy
      @event.destroy
      render json: {
        success: true,
        eventID: params[:event_id]
      }
    end
  end

  private

  def event_params
    params.permit(:name, :location, :description, :attend)
  end
end
