class Public::ThoughtseCommentsController < ApplicationController
  def create
    @thoughtse_comment = current_customer.thoughtse_comments.new(thoughtse_comment_params)
    @thoughtse_comment.save!
    redirect_back(fallback_location: root_url)
  end

  def destroy
    @thoughtse_comment = ThoughtseComment.find(params[:id])
    @thoughtse_comment.destroy
    redirect_to public_post_path(params[:post_id])
  end

  private

  def thoughtse_comment_params
    params.require(:thoughtse_comment).permit(:content, :post_id, :evaluation_score)
  end
end
