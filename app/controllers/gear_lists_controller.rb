class GearListsController < ApplicationController

    def index
        @gear_lists = GearList.all
    end

    private

    def gear_list_params
        params.require(:gear_list).permit(:name)
    end
end
