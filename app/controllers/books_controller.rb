class BooksController < ApplicationController
 before_action :correct_user, only: [:edit, :update]


  def index
    @book=Book.new
    @books=Book.all
  end
  def create
   @book=Book.new(book_params)
   @book.user_id=current_user.id
   if @book.save
        redirect_to book_path(@book.id),notice:'You have created book successfully.'
   else
       @books=Book.all
       render 'index'
   end
  end
  def show
    @book_new=Book.new
    @book=Book.find(params[:id])
    @user=@book.user
  end

  def edit
   @book=Book.find(params[:id])
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
   @book=Book.find(params[:id])
   if @book.update(book_params)
   redirect_to book_path,notice:'You have updated book successfully.'
   else
     render :edit
   end
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

    def correct_user
     @book = Book.find(params[:id])
     unless @book.user == current_user
     redirect_to (books_path)
     end
    end
end