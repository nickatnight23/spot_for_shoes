class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_shoes, through: :reviews, source: :shoe

    has_many :shoes, dependent: :destroy

    validates :username, uniqueness: true, presence: true 

    has_secure_password


def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

  def self.from_omniauth(auth)
    
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      # binding.pry
      user.provider = auth.provider
      user.username = auth.info.name
      user.uid = auth.uid
      user.password = SecureRandom.hex(10)

  end
end
end

