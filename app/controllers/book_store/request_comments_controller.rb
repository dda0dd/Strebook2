class BookStore::RequestCommentsController < ApplicationController
  def index
    @request_comments = RequestComment.all.page(params[:page]).per(5)
  end

  def search
    @word = params[:word]
    @request_comments = RequestComment.where("content LIKE?", "%#{@word}%").page(params[:page]).per(5)
    render "book_store/request_comments/index"
  end
end
