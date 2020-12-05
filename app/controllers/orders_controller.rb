class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @items = Item.find(params[:item_id])
    @user_order = UserOrder.new
     if @items.user_id == current_user.id || @items.order != nil
      redirect_to root_path
     end
  end

  def create
    @items = Item.find(params[:item_id])
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :tel_number, :order_id).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
