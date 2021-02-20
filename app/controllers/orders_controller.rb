class OrdersController < ApplicationController
  before_action :set_visit, only: [:index, :show, :new, :create, :edit, :update]
  before_action :set_order, only: [:show]

  def index
    @orders = policy_scope(Order).order(created_at: :desc)
    @orders = @visit.orders
    @orders_hash = @orders.each_with_object(Hash.new(0)) { |order,counts| counts[order.dish] += 1 }
    @total = 0
  end

  def show
  end

  def new
    @order = Order.new
    authorize @order
  end

  def create
    @order = Order.new(order_params)
    authorize @order
    @order.visit = @visit
    if @order.save
      redirect_to visit_orders_path
    else
      render 'restaurants/show'
    end
  end

  def edit
  end

  def update
    @order.update(order_params)
    redirect_to visit_orders_path
  end

  private

  def set_visit
    @visit = Visit.find(params[:visit_id])
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:visit).permit(:dish_id, :status)
  end
end
