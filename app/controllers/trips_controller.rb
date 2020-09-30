class TripsController < ApplicationController

    before_action :require_login

    def new
        if params[:user_id]
            @user = User.find_by(id: params[:user_id])
            if @user != current_user
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
        if params[:filter]
            user = User.find_by(id: params[:user_id])
            if user == current_user
                case params[:filter]
                when 'All'
                    @trips = user.trips
                when 'Upcoming'
                    @trips = Trip.upcoming_for_user(user)
                when 'Past'
                    @trips = Trip.past_for_user(user)
                else
                    redirect_to user_path(user), alert: "Try again"
                end
            else 
                redirect_to user_path(user), alert: "Those aren't your trips"
            end
        else
            @trips = Trip.all
        end
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
    
    def destroy
        @trip = Trip.find_by(id: params[:id])
        if @trip.user != current_user
            redirect_to user_path(current_user), alert: "That trip doesn't belong to you"
        else
            @trip.delete
            redirect_to user_path(current_user), alert: "Trip cancelled!"
        end
    end

    private
    
    def trip_params
        params.require(:trip).permit(:destination, :pickup, :dropoff, :gear_list_id)
    end

end
