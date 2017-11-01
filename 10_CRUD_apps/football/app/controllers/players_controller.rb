class PlayersController < ApplicationController
  before_action :find_player, only: [:show, :edit, :update, :destroy]

  def index
    @players = Player.all
  end

  def show
  end

  def new
    @player = Player.new
  end

  def edit
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to @player
    else
      render 'new'
    end
  end

  def update
    if @player.update(player_params)
      redirect_to @player
    else
      render 'edit'
    end
  end

  def destroy
    @player.destroy

    redirect_to players_path
  end

  private

  def player_params
    params.require(:player).permit(:name, :age)
  end

  def find_player
    @player = Player.find(params[:id])
  end
end
