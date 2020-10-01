class Item < ApplicationRecord
    belongs_to :gear_list
    validates :name, presence: true
    validates :description, presence: true
    validates :condition, presence: true
    validates_associated :gear_list
    
    def gear_list_attributes=(gear_list_attributes)
        if gear_list_attributes[:name].present? && gear_list_id.blank?
            self.build_gear_list(name: gear_list_attributes[:name])
        end
    end
end
