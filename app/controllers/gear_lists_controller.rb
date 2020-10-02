class GearListsController < ApplicationController

    def index
        @gear_lists = GearList.all
    end

end
