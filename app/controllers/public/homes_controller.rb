class Public::HomesController < ApplicationController

  def top
    @event = Event.new #新しくイベント登録用
    #当日の開催イベント一覧取得
    @date = Date.today
    @today_events = Event.where(hold_date: @date)
  end
end
