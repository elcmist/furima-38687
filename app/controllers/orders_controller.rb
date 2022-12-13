class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only:[:index, :create]

  def index
    @item_order = ItemOrder.new
    # if current_user.id == @item.user_id || @item.order.present? 
    #   redirect_to root_path

    
    # if user_signed_in? && current_user.id != @item.user_id && @item.order == nil
    #   @item_order = ItemOrder.new
    # else
    #   redirect_to root_path
    # end
  end

  def create
   
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      # pay_item
      @item_order.save
      return redirect_to root_path
    else
      render action: :index
    end
        
  end

  private
  def order_params
    params.require(:item_order).permit(:num, :prefecture_id, :city, :area, :building, :phone).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id )
  end
  # def order_params
  #   params.permit(:price, :token, :order_addresses, :item_id, :num, :prefectures_id, :city, :area, :building, :phone,).merge(user_id: current_user.id)
  # end

  def set_item
    @item = Item.find(params[:item_id])
  end

  # def pay_item
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #   Payjp::Charge.create(
  #     amount: @item.price,     # 商品の値段
  #     card: order_params[:token],     # カードトークン
  #     currency:'jpy'              # 通貨の種類（日本円）
  #   )
  # end

end
