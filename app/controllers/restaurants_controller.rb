require 'rqrcode'

class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  def index
    @restaurants = policy_scope(Restaurant).order(created_at: :desc)
    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { restaurant: restaurant })
      }
    end
  end

  def show
    @dishes = @restaurant.dishes.order(id: :asc)
    @dish = Dish.new
    @visit = Visit.last
    if params[:query].present?
      @dishes = @dishes.search_by_name_and_category(params[:query])
    else
      @dishes = @dishes.all
    end
    @menu_order = ['Starters', 'Soups', 'Salads', 'Main Dishes', 'Meat', 'Fish', 'Pasta', 'Vegetarian', 'Vegan', 'Desserts', 'Beverages', 'Beers', 'Alcoholic Beverages', 'Hot Beverages']
    @dish_categories = @dishes.map(&:category).uniq
    @average_price = average_price
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

  def average_price
    set_restaurant
    if @restaurant.dishes.average(:price) <= 7
      '<h2><span style="color:rgba(189, 195, 199, 0.8)">€€</span>€</h2>'.html_safe
    elsif @restaurant.dishes.average(:price) > 7 && @restaurant.dishes.average(:price) <= 15
      '<h2><span style="color:rgba(189, 195, 199, 0.8)">€</span>€€</h2>'.html_safe
    else
      "€€€"
    end
  end
end
