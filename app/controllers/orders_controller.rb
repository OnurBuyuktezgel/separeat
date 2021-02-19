class OrdersController < ApplicationController
  def index
    @order = policy_scope(Order).order(created_at: :desc)
  end
end
