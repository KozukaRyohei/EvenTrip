class Public::FavoritesController < ApplicationController
before_action :authenticate_user!,only: [:create,:destroy]
before_action :matching_login_user,only: [:create,:destroy]
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: @post.id)
    favorite.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: @post.id)
    favorite.destroy
  end
  
  def matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to request.referer
    end
  end
end
