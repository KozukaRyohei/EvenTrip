class Admin::UsersController < ApplicationController
  
  before_action :authenticate_admin # 管理者認証のためのフィルター

    def index
      @users = User.all
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'ユーザーのステータスが更新されました。'
      else
        render 'index'
      end
    end

    private

    def user_params
      params.require(:user).permit(:status)
    end
    
    def authenticate_admin
      unless current_user && current_user.admin?
        # 管理者でないユーザーの場合、適切なリダイレクトやエラーハンドリングを行う
        flash[:alert] = "管理者権限が必要です。"
        redirect_to root_path
      end
    end
    
  end
