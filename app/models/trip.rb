class Trip < ApplicationRecord
    include ActiveModel::Validations
    belongs_to :user
    belongs_to :gear_list
    validates :destination, presence: true

    validates :pickup, presence: true
    validates_with PickupValidator, if: :pickup

    validates :dropoff, presence: true
    validates :gear_list, presence: true
    validates_with DropoffValidator, if: :dropoff

    scope :user_upcoming, -> (user) {where("user_id = ?", user.id).where("pickup > ?", Time.now)}
    scope :user_past, -> (user) {where("user_id = ?", user.id).where("dropoff < ?", Time.now)}


    def gear_list_attributes=(gear_list_attributes)      
        self.build_gear_list(gear_list_attributes) unless self.gear_list_id 
    end

end
