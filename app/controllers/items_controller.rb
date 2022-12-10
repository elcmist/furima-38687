class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show]
  before_action :set_item, only: [:show, :edit, :update,]
  
  def index
     @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end
  
  def show
    
  end

  def create
    
    @item = Item.new(create_params)
    if @item.save
       redirect_to root_path
    else
      render :new
    end
  end

  def edit
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def update
    if @item.update(create_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end



  private
   def create_params
    params.required(:item).permit(:image, :name, :explanation, :category_id, :status_id, :delivery_cost_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
   end

   def set_item
    @item = Item.find(params[:id])
   end

  

end

