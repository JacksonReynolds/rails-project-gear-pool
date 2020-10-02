class TripsController < ApplicationController

    before_action :require_login
    before_action :set_trip, except: [:new, :create, :index]

    def new
        if params[:user_id]
            @user = User.find_by(id: params[:user_id])
            if @user != current_user
                redirect_to root_path, alert: "Please sign in to plan a trip"
            else
                @trip = @user.trips.build
                @gl = @trip.build_gear_list
                @gear_lists = GearList.all
            end
        else
            redirect_to user_path(current_user), alert: 'Please plan a trip from your profile'
        end
    end

    def index
        if params[:filter]
            user = User.find_by(id: params[:user_id])
            if user == current_user
                @trips = set_user_trips
            else 
                redirect_to user_path(user), alert: "Those aren't your trips"
            end
        else
            redirect_to user_path(current_user), alert: "You can view your trips from your profile!"
        end
    end

    def create
        @trip = current_user.trips.build(trip_params)
        if @trip.save
            redirect_to user_trip_path(current_user, @trip)
        else
            @gear_lists = GearList.all
            render 'new'
        end
    end

    def show; end

    def edit
        @gear_lists = GearList.all
    end
    
    def update
        if @trip.update(trip_params)
            redirect_to user_trip_path(current_user, @trip)
        else 
            @gear_lists = GearList.all
            render 'edit'
        end
    end
    
    def destroy
        if @trip.user != current_user
            redirect_to user_path(current_user), alert: "That trip doesn't belong to you"
        else
            @trip.delete
            redirect_to user_path(current_user), alert: "Trip cancelled!"
        end
    end

    private

    def set_user_trips
        case params[:filter]
        when 'All'
            current_user.trips
        when 'Upcoming'
            Trip.user_upcoming(current_user)
        when 'Past'
            Trip.user_past(current_user)
        end
    end

    def set_trip
        @trip = Trip.find_by(id: params[:id])
    end
    
    def trip_params
        params.require(:trip).permit(:destination, :pickup, :dropoff, :gear_list_id)
    end

end
