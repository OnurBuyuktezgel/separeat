class DishesController < ApplicationController
  # before_action :set_dish, only: [:show]
  before_action :set_restaurant_id, only: [:index, :show, :new, :create]

  def index
    @dishes = policy_scope(Dish).order(created_at: :desc)

    @dishes = @restaurant.dishes
    if params[:query].present?
      @dishes = Dish.search_by_name_and_category(params[:query])
    else
      @dishes = Dish.all
    end
  end

  def show
    # @dishes = @restaurant.dishes
  end

  def new
    @dish = Dish.new
    authorize @dish
  end

  def create
    @dish = Dish.new(dish_params)
    authorize @dish
    @dish.restaurant = @restaurant
    if @dish.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def set_restaurant_id
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def dish_params
    params.require(:dish).permit(:name, :todays_special, :description, :category, :price)
  end
end
