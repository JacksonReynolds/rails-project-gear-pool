class GearList < ApplicationRecord
    has_many :items
    has_many :trips
    has_many :users, through: :trips
    validates :name, presence: true
    validates :name, uniqueness: true

end
