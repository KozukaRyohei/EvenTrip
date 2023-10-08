class Public::HomesController < ApplicationController

  def top
    @event = Event.new #新しくイベント登録用
    # @search_event = Event. #イベント検索用
    #当日の開催イベント一覧取得
    @date = Date.today
    # d = Date.today
    # @year = d.year.to_s
    # @month = d.month.to_s
    # @day = d.day.to_s
    @today_events = Event.where(hold_date: @date)
  end
end
