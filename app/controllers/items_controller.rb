class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end  

  def new
    @item = Item.new
  end

  def create
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :explain, :category_id, :state_id, :shipping_id, :area_id, :number_of_day_id, :price)
  end
  
end
