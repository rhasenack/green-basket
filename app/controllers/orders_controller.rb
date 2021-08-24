class OrdersController < ApplicationController

  def index
    @orders = Order.all.where("user_id = #{current_user.id}")
    @baskets = Basket.all.where("user_id = #{current_user.id}")
  end

  def new
    @basket = Basket.find(params[:basket_id])
    @order = Order.new
    create
  end

  def create
    basket = Basket.find(params[:basket_id])
    @order = Order.new
    @order.price = basket.price
    @order.status = 'requested'
    @order.basket_id = basket.id
    @order.user_id = current_user.id
    if @order.save
      basket.status = 'reserved'
      basket.save
    end
    redirect_to orders_path
  end

  def decline
    @order = Order.find(params[:id])
    @order.status = 'Cancelled'
    @order.save
    basket = @order.basket
    basket.status = 'available'
    basket.save
    redirect_to orders_path
  end

  def accept
    @order = Order.find(params[:id])
    @order.status = 'Confirmed'
    @order.save
    basket = @order.basket
    basket.status = 'reserved'
    basket.save
  end

  def cancel
    @order = Order.find(params[:id])
    @order.status = 'Cancelled'
    @order.save
    basket = @order.basket
    basket.status = 'unavailable'
    basket.save
  end
end
