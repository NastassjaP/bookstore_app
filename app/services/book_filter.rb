class BookFilter
  def initialize(current_user)
    if current_user
      @current_user = current_user.id
    end
  end

  def filter
    @books=Book.where.not(user_id: @current_user)
  end
end
