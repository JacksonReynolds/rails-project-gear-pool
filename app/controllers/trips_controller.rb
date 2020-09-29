class TripsController < ApplicationController
    def new
        if params[:user_id] && @user = User.find_by(id: params[:user_id])
            @trip = @user.trips.build
            @gl
        else
            @trip = Trip.new
        end
        @gl = @trip.build_gear_list
        5.times {@gl.items.build}
        @gear_lists = GearList.all
        @items = Item.all
    end

    def index
        @trips = Trip.all
    end

    def create
        @trip = current_user.trips.build(trip_params)
        if @trip.save
            redirect_to trip_path(@trip)
        else
            @gear_lists = GearList.all
            @items = Item.all
            5.times {@trip.gear_list.items.build}
            render 'new'
        end
    end

    def show
        @trip = Trip.find_by(id: params[:id])
    end

    private
    
    def trip_params
        params.require(:trip).permit(:destination, :pickup, :dropoff, :gear_list_id, gear_list_attributes: [
            :name,
            items_attributes: [
                :id
            ]
        ])
    end

end
