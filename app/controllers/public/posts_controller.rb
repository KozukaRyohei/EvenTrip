class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.user_id = current_user.id
    @post.event_id = params[:event_id]
    if @post.save
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

  def destroy
    @post = Post.find_by(params[:event_id],params[:post_id])
    user = @post.user
    @post.destroy
    redirect_to user_path(user), method: :get
  end

  def resize_image(width,height)
    post_params[:post_images].each do |image|
      image.tempfile = ImageProcessing::MiniMagick.source(image.tempfile).resize_to_fit(width, height).call
    end
  end

  private

  def post_params
    params.require(:post).permit(:text, post_images: [])
  end
end
