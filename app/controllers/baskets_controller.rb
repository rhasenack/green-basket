class BasketsController < ApplicationController
  def index
    @baskets = Basket.all
  end

  def show
    @basket = Basket.find(params[:id])
  end

end
