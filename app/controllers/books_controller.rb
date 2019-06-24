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

  private
  def book_params
  params.require(:book).permit(:name,:description,:date_published,:genre_id,:user_id)
  end
end
