class User < ApplicationRecord
  has_many :books
  has_many :genres, :through => :books
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :associations, dependent: :destroy
  has_many :authors_associations, -> {where 'association_type = "author"'}, class_name: "Association"
  has_many :purchasable_associations, -> {where 'association_type = "purchaser"'}, class_name: "Association"
  has_many :authors, through: :authors_associations, source: :book
  has_many :purchases, through: :purchasable_associations, source: :book
end
