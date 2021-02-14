class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]


  def index
    @restaurants = Restaurant.all
    @restaurants = policy_scope(Restaurant).order(created_at: :desc)
  end

  def show
    @dishes = @restaurant.dishes
    @dish = Dish.new
  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    authorize @restaurant
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :email, :phone, :category, :photo)
  end
end
