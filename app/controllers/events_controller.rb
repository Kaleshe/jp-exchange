class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @today = Date.today

    @event = Event.new
    render :new


  end

  def create
    @event = Event.new(params.require(:event).permit(:title, :description, :location, :date, :time, :image))

    respond_to do |format|
      if @event.save
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @event = Event.find_by_id(params[:id])
  end
end
