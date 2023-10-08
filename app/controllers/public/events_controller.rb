class Public::EventsController < ApplicationController

  def index
    @events = Event.all
    if params[:search].present?
      @events = @events.where('name LIKE ?', "%#{params[:search]}%")
    end
  end

  private

  def event_params
      params.require(:event).permit(:name)
  end
end
