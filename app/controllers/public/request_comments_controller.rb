class Public::RequestCommentsController < ApplicationController
  def new
    @request_comment = RequestComment.new
  end

  def create
    @request_comment = current_customer.request_comments.new(request_comment_params)
    @request_comment.save!
    redirect_to public_customer_path(current_customer)
  end

  def destroy
    @request_comment = RequestComment.find(params[:id])
    @request_comment.destroy
    redirect_to public_customer_path(params[:id])
  end

  private

  def request_comment_params
    params.require(:request_comment).permit(:content)
  end
end
