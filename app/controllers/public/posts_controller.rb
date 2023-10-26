class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    # resize_image(500,500)
    # @post.post_images.attach(params[:post][:post_images])
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

  def resize_image(width,height)
    post_params[:post_images].each do |image|
      image.tempfile = ImageProcessing::MiniMagick.source(image.tempfile).resize_to_fit(width, height).call
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
