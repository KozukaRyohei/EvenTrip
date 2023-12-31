class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?
   before_action :check_user_status

   def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number])
   end

private

  #退会された(ステータス)ユーザーはログインできないようにする
  def check_user_status
    if user_signed_in? && current_user.is_deleted
      sign_out current_user
      flash[:alert] = "あなたのアカウントは削除されました。"
      redirect_to new_user_session_path
    end
  end

end