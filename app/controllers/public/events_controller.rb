class Public::EventsController < ApplicationController

  def index
     @events = Event.all
    case params[:sort]
      when 'newest'
        @events = @events.order(hold_date: :desc)
      when 'oldest'
        @events = @events.order(hold_date: :asc)
      else
        # デフォルトは特にソートしない
    end

    if params[:search].present?
      @events = @events.where('name LIKE ?', "%#{params[:search]}%")
    end
  end

  def show
    @event = Event.find(params[:id])
    @posts = Post.where(event_id: @event.id)
    @last_changer = User.find(@event.last_editor_id)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.last_editor_id = current_user.id
    @event.created_by = current_user.id
    if @event.save
      flash[notice] = "イベントを登録しました。"
       redirect_to event_path(id: @event.id)
    else
       flash.now[:alert] = "登録に失敗しました。"
       render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.last_editor_id = current_user.id
    if @event.update(event_params)
      redirect_to event_path(@event), notice: "イベント内容を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
      params.require(:event).permit(:name, :hold_date, :hold_place, :event_image)
  end
end
