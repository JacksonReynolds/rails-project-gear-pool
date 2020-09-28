class GearList < ApplicationRecord
    has_many :items
    has_many :trips
    has_many :users, through: :trips

    accepts_nested_attributes_for :items, reject_if: proc {|attributes| attributes["name"].blank?}
end
