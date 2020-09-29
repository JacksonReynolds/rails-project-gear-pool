class Trip < ApplicationRecord
    belongs_to :user
    belongs_to :gear_list

    # accepts_nested_attributes_for :gear_list, reject_if: proc {|attributes| attributes["name"].blank?}

    def gear_list_attributes=(gear_list_attributes)      
        self.build_gear_list(gear_list_attributes) unless self.gear_list_id 
    end
end
