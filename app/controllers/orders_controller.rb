class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
def index
  @order_address = OrderAddress.new
  
  unless   @item.order == nil && current_user.id != @item.user.id 
    redirect_to root_path  
  end
 
end



def create
 
  @order_address = OrderAddress.new(order_address_params)
  if @order_address.valid?
    pay_item
     @order_address.save
      redirect_to root_path
  else 
    render :index
  end
end




private

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.place,  
    card: order_address_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
end


def order_address_params
  params.require(:order_address).permit(:post_number, :area_id, :city, :house_num, :building_name, :phone_number).merge(user_id:  current_user.id, item_id: params[:item_id], token: params[:token])
end
end


def set_item
  @item = Item.find(params[:item_id])
end




