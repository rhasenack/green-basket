class FavouritesController < ApplicationController

  # def new
  #   @basket = Basket.find(params[:basket_id])
  #   @favourite = Favourite.new
  #   authorize @favourite
  #   # raise
  #   create
  #   redirect_to baskets_path
  # end

  def create
    @user = current_user
    @basket = Basket.find(params[:basket_id])
    @favourite = Favourite.new(user: @user, basket: @basket)
    authorize @favourite
    @favourite.save
    redirect_to baskets_path
  end

  def destroy
    @favourite = Favourite.find(params[:id])
    authorize @favourite
    @favourite.destroy
    redirect_to baskets_path
  end
end
