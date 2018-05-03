class EventsController < ApplicationController

  def new
  	@event = Event.new
  end

  def create
  	@event = current_user.created_events.new(event_params)
  	@event.save
  	redirect_to @event
  end

  def show
  	@event = Event.find(params[:id])
  	@creator = @event.creator_id
  end

  def suscribe
    @event = Event.find(params[:id])
    @event.attendees << current_user
    redirect_to @event
  end

  def index
  	@events = Event.all
  end

  private

  def event_params
  	params.require(:event).permit(:description, :date, :place)
  end
end
