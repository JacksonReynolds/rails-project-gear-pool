class GearListsController < ApplicationController

    def new

    end

    def create

    end

    private

    def gear_list_params
        params.require(:gear_list).permit(:name)
    end
end
