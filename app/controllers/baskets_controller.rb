class BasketsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  def index
    @baskets = Basket.all
  end

  def show
    @basket = Basket.find(params[:id])
  end

  def new
    @basket = Basket.new()
  end

  def create
    @basket = Basket.new(basket_params)
    # IF USER IS LOGGED IN
    @basket.user_id = current_user.id
    if @basket.save
      redirect_to baskets_path
    else
      render :new
    end
  end

  private

  def basket_params
    params.require(:basket).permit(:description, :address, :price, :stock, :photo)
  end
end
