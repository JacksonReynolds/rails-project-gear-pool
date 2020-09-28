class TripsController < ApplicationController
    def new
        @trip = Trip.new
        @trip.build_gear_list
        @gear_lists = GearList.all
    end

    def create
        binding.pry
    end

    private
    


end
