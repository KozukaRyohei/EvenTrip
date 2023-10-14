class Public::HashtagsController < ApplicationController

  def show
    @hash_tag = Hashtag.find_by(name: params[:name])
    @posts = @hash_tag.posts
  end
    #@tag = Hashtag.find_by(name: params[:tag])
    #@posts = @tag.posts
end
