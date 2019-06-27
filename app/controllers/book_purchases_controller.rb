class BookPurchasesController < ApplicationController
  def create
    puts params["purch_book"]
    @user=User.find(current_user.id)
    @user.purchasable_associations.create(:user_id=>current_user.id,:book_id=>params["purch_book"],:association_type=>'purchaser')
  end

private
  def purchase_params
    params.require(:purchasable_associations).permit(:user_id,:book_id,:association_type)
  end
end
