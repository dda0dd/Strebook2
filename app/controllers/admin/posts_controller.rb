class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all.page(params[:page]).per(5)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

  def search
    @word = params[:word]
    @range = params[:range]
    if @range == "Word"
      @posts = Post.where("content LIKE?", "%#{@word}%").page(params[:page]).per(5)
      render "admin/posts/index"
    else
      tag_ids = Tag.where("name LIKE?", "%#{@word}%").pluck(:id)
      book_store_ids = BookStore.eager_load(:tags).where(tags: {id: tag_ids}).pluck(:id)
      @posts = Post.where(book_store_id: book_store_ids).page(params[:page]).per(5)
      render "admin/posts/index"
    end
  end
end
