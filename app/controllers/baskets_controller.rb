class BasketsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @baskets = Basket.all.where("status = 'available'")
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
