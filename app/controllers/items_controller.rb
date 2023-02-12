class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end  

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    unless @item.save
      render action: :new
    else
      redirect_to root_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end  

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :explain, :category_id, :state_id, :shipping_id, :area_id, :number_of_day_id, :price).merge(user_id: current_user.id)
  end  
end
