class TripsController < ApplicationController
    def new
        @trip = Trip.new
        @gear_list = @trip.gear_list.build
    end

    def create

    end


end
