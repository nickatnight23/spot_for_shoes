class Shoe < ApplicationRecord
  belongs_to :brand
  belongs_to :user #created it
  has_many :reviews
  has_many :users, through: :reviews #people who have reviewed

  accepts_nested_attributes_for :brand
end
