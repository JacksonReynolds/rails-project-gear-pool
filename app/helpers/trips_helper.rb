module TripsHelper
    def show_page_time_format(time)
        time.strftime('%A %B %e @ %R')
    end

    def index_table_time_format(time)
        time.strftime('%D @ %R')
    end

    def gear_list_name(obj)
        obj.gear_list.name
    end

    def user_name(trip)
        trip.user.user_name
    end
end
