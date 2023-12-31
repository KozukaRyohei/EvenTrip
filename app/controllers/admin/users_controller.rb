class Admin::UsersController < ApplicationController
before_action :authenticate_admin!,only: [:index,:update]

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

    def show
      @user = User.find(params[:id])
    end

    private

    def user_params
      params.require(:user).permit(:is_deleted)
    end
  end
