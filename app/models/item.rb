class Item < ApplicationRecord
    belongs_to :gear_list
    validates :name, presence: true
    validates :description, presence: true
    validates :condition, presence: true
    validates_associated :gear_list
end
