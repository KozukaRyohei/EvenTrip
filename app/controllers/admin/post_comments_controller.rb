class Admin::PostCommentsController < ApplicationController

  def index
    @search_word = params[:search]
    if @search_word
      @comments = PostComment.where("comment LIKE ?", "%#{@search_word}%")
    else
      @comments = PostComment.all
    end
  end

  def destroy
    @comment = PostComment.find(params[:id])
    @comment.destroy
    redirect_to admin_post_comments_path, notice: 'コメントが削除されました'
  end

end
