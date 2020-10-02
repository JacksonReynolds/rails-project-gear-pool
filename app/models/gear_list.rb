class GearList < ApplicationRecord
    has_many :items
    has_many :trips
    has_many :users, through: :trips
    validates :name, presence: true
    validates :name, uniqueness: true

    scope :most_trips, -> {order(trips: :desc).limit(5)}

end
