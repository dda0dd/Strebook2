class BookStore::CommentsController < ApplicationController
  def index
    @thoughtse_comments = Post.find(params[:post_id]).thoughtse_comments.page(params[:page]).per(5)
  end
end
