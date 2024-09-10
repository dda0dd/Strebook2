class BookStore::PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @thoughtse_comments = ThoughtseComment.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.book_store_id = current_book_store.id
    if @post.save
      flash[:notice] = "You have created book_store successfully."
      redirect_to book_store_book_store_path(current_book_store)
    else
      @book_stores = BookStore.all
      @book_store = current_book_store
      render :index
    end
  end

  def edit
    @book_store = Book_store.find(params[:id])
  end

  def update
    @book_store = Book_store.find(params[:id])
    if @book_store.update(book_store_params)
      @post.save_tags(params[:post][:tag])
      flash[:notice] = "You have updated the book_store successfully."
      redirect_to book_store_path(@book_store)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to book_store_book_store_path(@post.book_store)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
