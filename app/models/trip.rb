class Trip < ApplicationRecord
    belongs_to :user
    belongs_to :gear_list
    validates :destination, presence: true
    validates :pickup, presence: true
    validates :dropoff, presence: true
    validates :gear_list, presence: true

    def gear_list_attributes=(gear_list_attributes)      
        self.build_gear_list(gear_list_attributes) unless self.gear_list_id 
    end

    def self.set_filtered_trips(filter, user)
        case filter
        when 'All'
            user.trips
        when 'Upcoming'
            where("user_id = #{user.id}").where("pickup > '#{Time.now}'")
        when 'Past'
            where("user_id = #{user.id}").where("dropoff < '#{Time.now}'")
        end
    end
end
