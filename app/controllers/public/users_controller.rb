class Public::UsersController < ApplicationController

  def favorited_posts
    @favorited_posts = Post.favorited_posts(current_user)
  end

end
