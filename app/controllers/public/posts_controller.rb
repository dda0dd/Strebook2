class Public::PostsController < ApplicationController
  def index
    @posts = Post.all.page(params[:page]).per(5)
  end

  def show
    @post = Post.find(params[:id])
    @book_store = @post.book_store
    @thoughtse_comments = @post.thoughtse_comments.all.page(params[:page]).per(5)
    @thoughtse_comment = ThoughtseComment.new
  end

  def search
    @word = params[:word]
    @range = params[:range]
    if @range == "Address"
      book_stores_ids = BookStore.where("address LIKE?", "%#{@word}%").pluck(:id)
      @posts = Post.where(book_store_id: book_stores_ids).page(params[:page]).per(5)
      render "public/posts/index"
    else
      tag_ids = Tag.where("name LIKE?", "%#{@word}%").pluck(:id)
      book_store_ids = BookStore.eager_load(:tags).where(tags: {id: tag_ids}).pluck(:id)
      @posts = Post.where(book_store_id: book_store_ids).page(params[:page]).per(5)
      render "public/posts/index"
    end
  end
end
