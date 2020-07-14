class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shoe

  validates :title, presence: true
  validates :stars, numericality: {only_integer: true,
   greater_than_or_equal_to: 0, less_than: 6}

   accepts_nested_attributes_for :shoe
   validates :shoe, uniqueness: {scope: :user, message:"has already been reviewed by you"}
end
