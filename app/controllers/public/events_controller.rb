class Public::EventsController < ApplicationController

  def index
    @events = Event.all #←降順で表示させたい
    if params[:search].present?
      @events = @events.where('name LIKE ?', "%#{params[:search]}%")
    end
  end

  def new
    @event = Event.new
  end
  def create
    @event = Event.new(event_params)
    if @event.save
    else
    end
  end

  private

  def event_params
      params.require(:event).permit(:name, :hold_date, :hold_place, :event_image)
  end
end
