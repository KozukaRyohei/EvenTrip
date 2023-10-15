class Public::HomesController < ApplicationController

  def top
    @event = Event.new #新しくイベント登録用
    #当日の開催イベント一覧取得
    @date = Date.today
    @today_events = Event.where(hold_date: @date)
  end
  
  def guest_sign_in
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
