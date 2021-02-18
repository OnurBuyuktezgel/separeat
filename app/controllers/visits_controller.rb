class VisitsController < ApplicationController
  def index
    @visits = Visit.all
    @visits = policy_scope(Visit).order(created_at: :desc)
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

  def visit_params
    params.require(:visit).permit(:user_id, :start_date, :end_date, :table_id, :guests, :total)
  end
end
