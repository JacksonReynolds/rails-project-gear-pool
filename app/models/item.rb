class Item < ApplicationRecord
    belongs_to :gear_list
    validates :name, presence: true
    validates :description, presence: true
    validates :condition, presence: true

    # accepts_nested_attributes_for :gear_list

    def gear_list_attributes=(gear_list_attributes)
        unless gear_list_attributes[:name].blank?
            self.build_gear_list(name: gear_list_attributes[:name])
        end
    end
end
