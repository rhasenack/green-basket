class OrdersController < ApplicationController


  def index
    @orders = Order.all.where("user_id = #{current_user.id}")
  end

  def new
    @basket = Basket.find(params[:basket_id])
    @order = Order.new()
  end

  def create
    basket = Basket.find(params[:basket_id])
    @order = Order.new()
    @order.price = basket.price
    @order.status = 'requested'
    @order.basket_id = basket.id
    @order.user_id = current_user.id
    @order.save
    redirect_to
  end
<<<<<<< HEAD
=======

>>>>>>> ab5495964ef1f540082185b63761c6f61874800c
end
