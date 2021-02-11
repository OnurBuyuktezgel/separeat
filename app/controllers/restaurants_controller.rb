class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :email, :phone, :category)
  end
end
