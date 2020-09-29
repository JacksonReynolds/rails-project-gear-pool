class User < ApplicationRecord
    validates :user_name, presence: true
    validates :user_name, uniqueness: true
    has_secure_password
    has_many :trips
    has_many :gear_lists, through: :trips
end
