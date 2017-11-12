class VisitorsController < ApplicationController
  before_action :find_cook, :find_waiter
  before_action :find_visitor, only: [:show, :edit, :update, :destroy]

  def index
    @visitors = @waiter.visitors
  end

  def new
    @visitor = @waiter.visitors.new
  end

  def create
    @visitor = @waiter.visitors.create(visitor_params)
    redirect_to cook_waiter_visitor_path(@cook, @waiter, @visitor)
  end

  def edit
  end

  def update
    @visitor.update(visitor_params)
    redirect_to cook_waiter_visitor_path
  end

  def destroy
    @visitor.destroy
    redirect_to cook_waiter_visitors_path
  end

  private

  def find_cook
    @cook = Cook.find(params[:cook_id])
  end

  def find_waiter
    @waiter = Waiter.find(params[:waiter_id])
  end

  def find_visitor
    @visitor = @waiter.visitors.find(params[:id])
  end

  def visitor_params
    params.require(:visitor).permit(:name)
  end
end
