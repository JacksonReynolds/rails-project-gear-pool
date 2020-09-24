class User < ApplicationRecord
    has_many :trips
    has_many :gear_lists, through: :trips
end
