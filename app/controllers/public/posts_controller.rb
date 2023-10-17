class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.event_id = params[:event_id]
    if @post.save
      # flash[notice] = "投稿に成功しました。"
      redirect_to event_post_path(@post.event_id, @post)
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end

  end

  def show
    @post = Post.find(params[:id])
    @comment = PostComment.new
    @tags = @post.hashtags
  end



  private

  def post_params
    params.require(:post).permit(:text, post_images: [])
  end
end
