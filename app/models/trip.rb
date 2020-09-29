class Trip < ApplicationRecord
    include ActiveModel::Validations
    belongs_to :user
    belongs_to :gear_list
    validates :destination, presence: true
    validates :pickup, presence: true
    validates :dropoff, presence: true
    validates :gear_list, presence: true
    validates_associated :gear_list
    validates_with GearListItemsValidator

    # accepts_nested_attributes_for :gear_list, reject_if: proc {|attributes| attributes["name"].blank?}

    def gear_list_attributes=(gear_list_attributes)      
        self.build_gear_list(gear_list_attributes) unless self.gear_list_id 
    end
end
