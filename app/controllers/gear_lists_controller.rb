class GearListsController < ApplicationController

    def index
        @gear_lists = GearList.all
    end

    def most_popular
        @gear_lists = GearList.most_trips
    end

end
