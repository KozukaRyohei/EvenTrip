class Public::HomesController < ApplicationController

  def top
    @event = Event.new #新しくイベント登録用
    # @search_event = Event. #イベント検索用
    #当日の開催イベント一覧取得
    d = Date.today
    @year = d.year.to_s
    @month = d.month.to_s
    @day = d.day.to_s
    @today_events = Event.where(hold_year: @year).where(hold_month: @month).where(hold_day: @day)
  end



  def top_params
      params.require(:top).permit(:name, :amount)
  end
end
