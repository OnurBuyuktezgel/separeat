class ReviewsController < ApplicationController
before_action :set_review, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!

def index
  @restaurant = Restaurant.find(params[:restaurant_id])
  @reviews = policy_scope(Review).order(created_at: :desc)
  @review = Review.new
end

def new
  @review = Review.new
  authorize @review
end

def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.restaurant = @restaurant
    authorize @review
    if @review.save
      redirect_to @review, anchor: "review-#{@review.id}"
    else
      render 'new'
    end
end

def update
  @review.update(review_params)
end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end


end
