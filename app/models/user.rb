class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_shoes, through: :reviews, source: shoe

    has_many :shoes
end
