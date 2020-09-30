class Trip < ApplicationRecord
    belongs_to :user
    belongs_to :gear_list
    validates :destination, presence: true
    validates :pickup, presence: true
    validates :dropoff, presence: true
    validates :gear_list, presence: true

    scope :upcoming_for_user, -> (user) {where("user_id = #{user.id}").where("pickup > '#{Time.now}'")}
    scope :past_for_user, -> (user) {where("user_id = #{user.id}").where("dropoff < '#{Time.now}'")}

    def gear_list_attributes=(gear_list_attributes)      
        self.build_gear_list(gear_list_attributes) unless self.gear_list_id 
    end
end
