module TripsHelper
    def show_page_time_format(time)
        time.strftime('%A %B %e @ %R')
    end

    def index_table_time_format(time)
        time.strftime('%D @ %R')
    end

    def gear_list_name(trip)
        trip.gear_list.name
    end
end
