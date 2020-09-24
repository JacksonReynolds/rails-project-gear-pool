class Trip < ApplicationRecord
    belongs_to :user
    belongs_to :gear_list

    accepts_nested_attributes_for :gear_list
end
