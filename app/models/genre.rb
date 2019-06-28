class Genre < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :users, :through => :books
end
