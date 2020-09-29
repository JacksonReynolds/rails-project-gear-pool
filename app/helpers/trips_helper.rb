module TripsHelper
    def show_page_time_format(time)
        time.strftime('%A %B %e @ %T')
    end
end
