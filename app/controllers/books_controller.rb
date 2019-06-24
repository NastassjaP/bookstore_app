class BooksController < ApplicationController

  def new
    @user=User.find(current_user.id)
    @book=@user.books.new
  end

  def create
    @user=User.find(current_user.id)
    @book=@user.books.create(book_params)
    redirect_to books_url
  end

  def index
    if current_user
      @user=User.find(current_user.id)
      @books=@user.books.all
    else
      @books=Book.all
    end
  end

  def show
    @book=Book.find(params[:id])
  end

  def edit
    @user=User.find(current_user.id)
    @book=@user.books.find(params[:id])
  end

  def update
    @user=User.find(current_user.id)
    @book=@user.books.find(params[:id])
    @book.update(book_params)
    redirect_to @book
  end

  private

  def book_params
  params.require(:book).permit(:name,:description,:date_published,:genre_id,:user_id)
  end

end
