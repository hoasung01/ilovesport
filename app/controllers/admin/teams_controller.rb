class Admin::TeamsController < ApplicationController
	def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      redirect_to admin_teams_path, notice: "Team created successfully."
    else
      render :new
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :country)
  end
end
