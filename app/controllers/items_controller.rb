class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :update, :edit ]

  def index
   @items = Item.order("created_at DESC")
  end
 
  def new
    @item = Item.new
  end

  def create  
    @item = Item.new(item_params)
 
   if @item.save
     redirect_to root_path
   else
     render :new
   end
   end
 
   def show
   end

   def edit
    
    unless current_user.id == @item.user.id 
      redirect_to action: :index
    end
   end
  
   def update   
   
   if @item.valid?
    @item.update(item_params)
    redirect_to action: :show
   else
    render :edit
  end
 end

def set_item
  @item = Item.find(params[:id])
end

private 
def item_params
  
params.require(:item).permit(:item_name, :title, :delivery_fee_id, :category_id, :status_id ,:area_id ,:period_id ,:place ,:image).merge(user_id: current_user.id)
end
end