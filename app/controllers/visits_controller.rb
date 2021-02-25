class VisitsController < ApplicationController
  before_action :set_visit, only: [:show, :update]

  def index
    @visits = policy_scope(Visit).order(created_at: :desc)
  end

  def show
    authorize @visit
    @orders = @visit.orders
    @dishes = []
    @orders.each {|order| @dishes << order.dish}
    @prices = []
    @dishes.each {|dish| @prices << dish.price}
    @total = @prices.sum
    @restaurant = @visit.table.restaurant
  end

  def new
    @visit = Visit.new
  end

  def create
    @visit = Visit.new(visit_params)
    authorize @visit
    @visit.user = current_user
    if @visit.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def update
    @visit.update(visit_params)
    redirect_to restaurant_path(@restaurant)
    # This path should be updated with the checkout success page!
  end

  private

  def set_visit
    @visit = Visit.find(params[:id])
    authorize @visit
  end

  def visit_params
    params.require(:visit).permit(:user_id, :start_date, :end_date, :table_id, :guests, :total)
  end
end
