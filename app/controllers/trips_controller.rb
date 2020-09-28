class TripsController < ApplicationController
    def new
        @trip = Trip.new
        @gl = @trip.build_gear_list
        5.times {@gl.items.build}
        # binding.pry
        @gear_lists = GearList.all
        @items = Item.all
    end

    def create
        binding.pry
    end

    private
    


end
