class TripsController < ApplicationController
    def new
        if params[:user_id]
            @user = User.find_by(id: params[:user_id])
            if !@user || @user != current_user
                redirect_to root_path, alert: "Please sign in to plan a trip"
            else
                @trip = @user.trips.build
            end
        else
            @trip = Trip.new
        end
        @gl = @trip.build_gear_list
        @gear_lists = GearList.all
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
            render 'new'
        end
    end

    def show
        @trip = Trip.find_by(id: params[:id])
    end
    
    # def destroy
    #     @trip = trip.find_by(id: params[:id])

    # end
    private
    
    def trip_params
        params.require(:trip).permit(:destination, :pickup, :dropoff, :gear_list_id)
    end

end
