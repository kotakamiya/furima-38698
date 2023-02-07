class ItemsController < ApplicationController
  def index
    @items = Item.all
  end  

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    unless @item.save
      render action: :'new'
    else
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :explain, :category_id, :state_id, :shipping_id, :area_id, :number_of_day_id, :price).merge(user_id: current_user.id)
  end  
end
