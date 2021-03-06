class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy, :add_quantity, :reduce_quantity]
  before_action :set_visit, only: [:index, :show, :new, :create, :edit, :update, :add_order]

  def index
    @orders = policy_scope(Order).order(created_at: :desc)
    @orders = @visit.orders
    @new_array = []
    @orders_hash = @orders.each_with_object(Hash.new(0)) { |order, counts| counts[order.dish] += 1 }
    @total = 0
  end

  def show
  end

  def new
    @order = Order.new
    authorize @order
  end

  def create
    @order = Order.new
    authorize @order
    @order.visit = @visit
    @dish = Dish.find(params[:dish_id])
    @order.dish = @dish
    @restaurant = @visit.table.restaurant

    if @order.save
      redirect_to visit_orders_path(@visit)
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

  def destroy
    authorize @order
    @visit = @order.visit
    @order.destroy
    redirect_to visit_orders_path(@visit)
  end

  def add_order
    @order = Order.new
    authorize @order
    @order.visit = @visit
    @dish = Dish.find(params[:dish_id])
    @order.dish = @dish
    @restaurant = @visit.table.restaurant
    if @order.save
      redirect_to restaurant_path(@restaurant, anchor: "dish_id_#{@dish.id}")
    else
      render 'restaurants/show'
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def set_visit
    @visit = Visit.find(params[:visit_id])
  end

  def order_params
    params.require(:order).permit(:status, :quantity, :dish_id)
  end

  def add_quantity
    @order.quantity += 1
    @order.save
    redirect_to visit_orders_path(@visit)
  end

  def reduce_quantity
    if @order.quantity > 1
      @order.quantity -= 1
    end
    @order.save
    redirect_to visit_orders_path(@visit)
  end
end
