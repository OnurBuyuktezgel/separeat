class VisitsController < ApplicationController
  before_action :set_visit, only: [:show, :update, :destroy]
  before_action :set_qr_data, only: :create

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
    authorize @visit
  end

  def create
    # creating a visit with the QR code
    @visit = Visit.new(start_date: Time.now)
    authorize @visit
    @visit.user = current_user
    @visit.table_id = @qr_data.to_i
    @restaurant = @visit.table.restaurant
    if @visit.save!
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def update
    @visit = Visit.update(end_date: Time.now)
    redirect_back fallback_loction: "#"
    # @visit.update(visit_params)
    # redirect_to restaurant_path(@restaurant)
    # This path should be updated with the checkout success page!
  end

  def destroy
    @visit.destroy
    redirect_to root_path
  end

  private

  def set_visit
    @visit = Visit.find(params[:id])
    authorize @visit
  end

  def set_qr_data
    qr_code_params = JSON.parse(params[:qr_code_json_data]).with_indifferent_access
    @qr_data = qr_code_params[:qr_data]
  end

  def visit_params
    params.require(:visit).permit(:user_id, :start_date, :end_date, :table_id, :guests, :total)
  end
end
