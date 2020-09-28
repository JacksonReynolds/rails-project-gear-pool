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
        @trip = Trip.new(trip_params)
        if @trip.save
            redirect_to trip_path(@trip)
        else
            render 'new'
        end
    end

    private
    
    def trip_params
        params.require(:trip).permit(:destination, :pickup, :dropoff, :gear_list_id, gear_list_attributes: [
            :name,
            items_attributes: [
                :name
    ]
])
    end

end
