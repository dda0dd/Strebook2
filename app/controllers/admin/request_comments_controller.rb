class Admin::RequestCommentsController < ApplicationController
  def index
    @request_comments = RequestComment.all.page(params[:page]).per(5)
  end

  def destroy
    @request_comment = RequestComment.find(params[:id])
    @request_comment.destroy
    redirect_to admin_request_comments_path
  end

  def search
    @word = params[:word]
    @request_comments = RequestComment.where("content LIKE?", "%#{@word}%").page(params[:page]).per(5)
    render "admin/request_comments/index"
  end
end
