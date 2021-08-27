class OrdersController < ApplicationController

  def index
    @orders = policy_scope(Order).where("user_id = #{current_user.id}")
    @baskets = policy_scope(Basket).where("user_id = #{current_user.id}")
  end

  def new
    @basket = Basket.find(params[:basket_id])
    @order = Order.new
    authorize @order
    create
  end

  def create
    basket = Basket.find(params[:basket_id])
    @order = Order.new
    authorize @order
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
    @order.status = 'Declined'
    @order.save
    basket = @order.basket
    basket.status = 'available'
    authorize basket
    basket.save
    redirect_to orders_path
  end

  def accept
    @order = Order.find(params[:id])
    @order.status = 'Confirmed'
    @order.save
    basket = @order.basket
    basket.stock -= @order.quantity
    authorize @order
    if basket.stock <= 0
      basket.status = 'unavailable'
    else
      basket.status = 'available'
    end
    basket.save

    redirect_to orders_path
  end

  def cancel
    @order = Order.find(params[:id])
    @order.status = 'Cancelled'
    @order.save
    basket = @order.basket
    basket.stock += 1
    if basket.stock <= 0
      basket.status = 'unavailable'
    else
      basket.status = 'available'
    end
    authorize @order
    basket.save
    redirect_to orders_path
  end
end
