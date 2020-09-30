class Item < ApplicationRecord
    belongs_to :gear_list
    validates :name, presence: true
    validates :description, presence: true
    validates :condition, presence: true

    accepts_nested_attributes_for :gear_list

end
