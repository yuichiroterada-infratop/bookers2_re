class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      flash[:notice] = "You have created book successfully!"
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
    
  end
  
  def show
    @book = Book.new
    @show_book = Book.find(params[:id])
  end

  def edit
    
  end
  
  def destroy
    
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
