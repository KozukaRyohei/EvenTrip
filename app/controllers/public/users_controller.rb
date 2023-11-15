class Public::UsersController < ApplicationController
  before_action :matching_login_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    #イベントの参加数カウント
    @unique_event_count = @posts.joins(:event).select('DISTINCT events.id').count
  end

  def edit
    matching_login_user
    @user = current_user
  end

  def update
    matching_login_user
    @user = current_user
    if @user.update(user_params)
      # 更新成功時の処理
      redirect_to user_path(@user.id), notice: "ユーザー情報が更新されました"
    else
      render 'edit'
    end
  end

  def withdrawal
    current_user.update(is_deleted: true)
    redirect_to new_user_registration_path
  end

  def favorited_posts
    @favorited_posts = Post.favorited_posts(current_user)
  end

  private

  def matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to request.referer
    end
  end

  def user_params
    params.require(:user).permit(:name, :user_image)
  end

end
