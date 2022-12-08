class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [ :index ]
  
  
  def index
     @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end
  
  def create
    
    @item = Item.new(create_params)
    if @item.save
       redirect_to root_path
    else
      render :new
    end
  end

  private
   def create_params
    params.required(:item).permit(:image, :name, :explanation, :category_id, :status_id, :delivery_cost_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
   end

end

