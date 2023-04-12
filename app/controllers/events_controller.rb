class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    render :new
  end

  def create
    @event = Event.new(params.require(:event).permit(:title, :description))
  end
end
