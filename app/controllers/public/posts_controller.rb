class Public::PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
    else
    end
  end

  private

  def post_params
    params.require(:post).permit(:text, post_image: [])
  end
end
