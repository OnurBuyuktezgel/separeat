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

  def qr_code
    set_restaurant

  qrcode = RQRCode::QRCode.new(restaurant_url(@restaurant))

    @svg = qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6,
      standalone: true
    )
  end

  def show
    @dishes = @restaurant.dishes
    @dish = Dish.new
    @visit = Visit.last

    if params[:query].present?
      @dishes = @dishes.search_by_name_and_category(params[:query])
    else
      @dishes = @dishes.all
    end

    @starters = []
    @dishes.each {|dish| @starters << dish if dish.category == "Starters"}
    @soups = []
    @dishes.each {|dish| @soups << dish if dish.category == "Soups"}
    @salads = []
    @dishes.each {|dish| @salads << dish if dish.category == "Salads"}
    @main_dishes = []
    @dishes.each {|dish| @main_dishes << dish if dish.category == "Main Dishes"}
    @meats = []
    @dishes.each {|dish| @meats << dish if dish.category == "Meat"}
    @fishes = []
    @dishes.each {|dish| @fishes << dish if dish.category == "Fish"}
    @pastas = []
    @dishes.each {|dish| @pastas << dish if dish.category == "Pasta"}
    @veggies = []
    @dishes.each {|dish| @veggies << dish if dish.category == "Vegetarian"}
    @vegans = []
    @dishes.each {|dish| @vegans << dish if dish.category == "Vegan"}
    @desserts = []
    @dishes.each {|dish| @desserts << dish if dish.category == "Desserts"}
    @beverages = []
    @dishes.each {|dish| @beverages << dish if dish.category == "Beverages"}
    @beers = []
    @dishes.each {|dish| @beers << dish if dish.category == "Beers"}
    @alc_bevs = []
    @dishes.each {|dish| @alc_bevs << dish if dish.category == "Alcoholic Beverages"}
    @hot_bevs = []
    @dishes.each {|dish| @hot_bevs << dish if dish.category == "Hot Beverages"}

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
      "€"
    elsif @restaurant.dishes.average(:price) > 7 && @restaurant.dishes.average(:price) <= 15
      "€€"
    else
      "€€€"
    end
  end
end
