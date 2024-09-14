class Admin::CommentsController < ApplicationController
  def index
    @thoughtse_comments = Post.find(params[:id]).thoughtse_comments.page(params[:page]).per(5)
  end

  def destroy
    @thoughtse_comment = ThoughtseComment.find(params[:id])
    @thoughtse_comment.destroy
    redirect_to admin_comments_path(id: @thoughtse_comment.post_id)
  end

  def search
    @word = params[:word]
    @thoughtse_comments = ThoughtseComment.where("content LIKE?", "%#{@word}%").page(params[:page]).per(5)
    render "admin/comments/index"
  end
end
