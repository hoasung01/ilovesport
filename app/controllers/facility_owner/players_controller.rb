class FacilityOwner::PlayersController < ApplicationController
  layout "facility_owner"
  before_action :authenticate_facility_owner!
  before_action :set_player, only: [:show, :edit, :update, :destroy]

  def index
    @players = current_facility_owner.players.all
  end

  def show
  end

  def new
    @player = current_facility_owner.players.new
  end

  def create
    @player = current_facility_owner.players.new(player_params)

    if @player.save
      redirect_to facility_owner_player_path(@player), notice: 'TraininPlayergGround was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @player.update(player_params)
      redirect_to facility_owner_player_path(@player), notice: 'Player was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @player.destroy
    redirect_to facility_owner_players_path, notice: 'Player was successfully destroyed.'
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:name, :mobile_number)
  end
end
