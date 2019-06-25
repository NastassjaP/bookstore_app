class BookPresenter
  def initialize(model, view)
    @model, @view = model, view
    super(@model)

    if @user ==false
      @books=Book.all
    end
  end
end
