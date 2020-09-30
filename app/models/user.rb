class User < ApplicationRecord
    validates :user_name, presence: true
    validates :user_name, uniqueness: true
    has_secure_password
    has_many :trips
    has_many :gear_lists, through: :trips

    def self.from_omniauth(auth)
        where(user_name: auth.info.email).first_or_initialize do |user|
            user.user_name = auth.info.email
            user.password = SecureRandom.hex
        end
    end
end
