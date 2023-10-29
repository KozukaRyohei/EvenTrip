class Public::UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    #イベントの参加数カウント
    @unique_event_count = @posts.joins(:event).select('DISTINCT events.id').count
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      # 更新成功時の処理
      redirect_to user_path(@user.id), notice: "ユーザー情報が更新されました"
    else
      render 'edit'
    end
  end

  def favorited_posts
    @favorited_posts = Post.favorited_posts(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :user_image)
  end

end
