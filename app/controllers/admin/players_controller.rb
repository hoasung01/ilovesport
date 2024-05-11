class Admin::PlayersController < ApplicationController
	def index
    @players = Player.all
  end

  def new
    @player = Player.new
    @teams = Team.all
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to admin_players_path, notice: "Player created successfully."
    else
      @teams = Team.all
      render :new
    end
  end

  private

  def player_params
    params.require(:player).permit(:name, :position, :team_id, :nationality, :birth_date)
  end
end
