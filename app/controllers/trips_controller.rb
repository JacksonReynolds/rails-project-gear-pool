class TripsController < ApplicationController
    def new
        @trip = Trip.new
        @gear_lists = GearList.all
        @items = Item.all
    end

    def create
        binding.pry
    end

    private
    


end
