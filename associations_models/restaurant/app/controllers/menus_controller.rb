class MenusController < ApplicationController
  before_action :find_cook, :find_waiter, :find_visitor
  before_action :find_menu, only: [:show, :edit, :update, :destroy]

  def new
    @menu = Menu.new
  end

  def create
    @menu = @visitor.create_menu(menu_params)
    redirect_to cook_waiter_visitor_menu_path(@cook, @waiter, @visitor, @menu)
  end

  def show
  end

  def edit
  end

  def update
    @menu.update(menu_params)
    redirect_to cook_waiter_visitor_menu_path
  end

  def destroy
    @menu.destroy
    redirect_to cook_waiter_visitor_menu_path
  end

  private

  def find_cook
    @cook = Cook.find(params[:cook_id])
  end

  def find_waiter
    @waiter = Waiter.find(params[:waiter_id])
  end

  def find_visitor
    @visitor = Visitor.find(params[:visitor_id])
  end

  def find_menu
    @menu = @visitor.menu.find(params)
  end

  def menu_params
    params.require(:menu).permit(:name)
  end
end
