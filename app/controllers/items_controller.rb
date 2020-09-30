class ItemsController < ApplicationController
    def show
        if params[:gear_list_id]
            @gl = GearList.find_by(id: params[:gear_list_id])
            if @gl.nil?
                redirect_to gear_lists_path, alert: 'Could not find that gear list'
            else
                @item = @gl.items.find_by(id: params[:id])
            end
        else
            @item = Item.find_by(id: params[:id])
        end
    end

    def index
        @items = Item.all
    end

    def new
        @item = Item.new
    end
end
