class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
   @items = Item.find(params[:item_id])
   @user_order = UserOrder.new
  end

  def create
    @items = Item.find(params[:item_id])
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      @user_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :tel_number, :order_id).merge(user_id: current_user.id)
  end

end
