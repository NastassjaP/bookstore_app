class BookPresenter
  def initialize(book)
     @book=book
  end

    def full_name
      "#{@book.user.first_name} #{@book.user.last_name}"
    end
end
