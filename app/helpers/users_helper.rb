module UsersHelper
    def user_upcoming_trips
        trips = current_user.trips.where("pickup > '#{Time.now}'")
    end
end
