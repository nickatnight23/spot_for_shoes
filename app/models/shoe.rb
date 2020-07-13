class Shoe < ApplicationRecord
  belongs_to :brand
  belongs_to :user #created it
  has_many :reviews
  has_many :users, through: :reviews #people who have reviewed

  validates :shoe_type, presence: true
  validate :not_a_duplicate
  accepts_nested_attributes_for :brand

  scope :order_by_rating, ->{left_joins(:reviews).group(:id).
  order('avg(stars)desc')}

  def self.alpha #scope method
    order(:shoe_type)
  end

 def brand_attributes=(attributes)
    brand = Brand.find_or_create_by(
      attributes) if !attributes['name'].empty?
  end

  def not_a_duplicate
    # if there is already a shoe with that type and brand, 
    #throw and error

    if Shoe.find_by(shoe_type: shoe_type, brand_id: brand_id)
      errors.add(:shoe_type, "has already been added for that brand")
  end
end

  def shoe_type_and_brand
    #"{shoe_type - #{brand.name}"
  end
end


