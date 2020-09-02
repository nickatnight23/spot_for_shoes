class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_shoes, through: :reviews, source: :shoe

    has_many :shoes, dependent: :destroy

    validates :username, uniqueness: true, presence: true

    has_secure_password
end

def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
end

