class BasketsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    if user_signed_in? && current_user.restaurant?
      @baskets = policy_scope(Basket).where("user_id = #{current_user.id}")

    end
    if !user_signed_in? || current_user.consumer?
      @baskets = policy_scope(Basket).order(created_at: :desc)
    end
    # raise
  end

  def show
    @basket = Basket.find(params[:id])
    authorize @basket

    @basket.geocode

    @markers = [{
        lat: @basket.latitude,
        lng: @basket.longitude
      }]

  end

  def new
    @basket = Basket.new()
    authorize @basket
  end

  def create
    @basket = Basket.new(basket_params)
    @basket.original_stock = @basket.stock
    authorize @basket
    # IF USER IS LOGGED IN
    @basket.user_id = current_user.id
    if @basket.save
      redirect_to baskets_path
    else
      render :new
    end
  end

  def favourites
    @favourite_baskets = []

    current_user.favourites.each do |favourite|
      basket = Basket.find(favourite.basket_id)
      authorize basket
      @favourite_baskets << basket
    end

  end

  private

  def basket_params
    params.require(:basket).permit(:description, :address, :price, :stock, :photo, :name)
  end
end
