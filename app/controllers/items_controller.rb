class ItemsController < ApplicationController

    before_action :require_login, except: [:index, :show]

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
        @item.build_gear_list
        @gear_lists = GearList.all

    end

    def create
        @item = Item.new(item_params)
        binding.pry
        if params[:item][:gear_list_id].present? && params[:item][:gear_list_attributes][:name].present?
            @item.errors[:gear_list] << "Must EITHER create new gear list or choose an existing list"
            @gear_lists = GearList.all
            render 'new'
        elsif @item.save 
            redirect_to items_path
        else
            @gear_lists = GearList.all
            @item.build_gear_list if !@item.gear_list
            # binding.pry
            render 'new'
        end
    end

    private

    def item_params
        params.require(:item).permit(:name, :description, :condition, :gear_list_id, gear_list_attributes: [:name])
    end
end
