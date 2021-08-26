class BasketsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    if current_user.restaurant?
        @baskets = policy_scope(Basket).where("user_id = #{current_user.id}")
    end
    if current_user.consumer?
      @baskets = policy_scope(Basket).order(created_at: :desc)
    end
  end

  def show
    @basket = Basket.find(params[:id])
    authorize @basket
  end

  def new
    @basket = Basket.new()
    authorize @basket
  end

  def create
    @basket = Basket.new(basket_params)
    @basket.original_stock = @bakset.stock
    authorize @basket
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
