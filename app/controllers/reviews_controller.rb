class ReviewsController < ApplicationController
  def new
    # we need @restaurant in our `simple_form_for`
    @basket = Basket.find(params[:basket_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @basket = Basket.find(params[:basket_id])
    @review.basket = @basket
    if @review.save
      redirect_to basket_path(@basket)
    else
      render :new
    end
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
