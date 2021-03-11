class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = policy_scope(Review).order(created_at: :desc)
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to restaurant_reviews_path(@restaurant, anchor: "review-first")
    else
      render :index
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
