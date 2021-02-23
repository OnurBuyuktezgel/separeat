class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:home]

  def home
    @restaurants = Restaurant.where(name: "Toni's Burgers")
  end
end
