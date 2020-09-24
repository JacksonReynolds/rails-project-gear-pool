class GearList < ApplicationRecord
    has_many :items
    has_many :trips
    has_many :users, through: :trips
end
