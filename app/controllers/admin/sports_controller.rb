class Admin::SportsController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!
  before_action :set_sport, only: [:show, :edit, :update, :destroy]

  def index
    @sports = Sport.all
  end

  def show
  end

  def new
    @sport = Sport.new
  end

  def create
    @sport = Sport.new(sport_params)

    if @sport.save
      redirect_to admin_sport_path(@sport), notice: 'Sport was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @sport.update(sport_params)
      redirect_to admin_sport_path(@sport), notice: 'Sport was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @sport.destroy
    redirect_to admin_sports_path, notice: 'Sport was successfully destroyed.'
  end

  private

  def set_sport
    @sport = Sport.find(params[:id])
  end

  def sport_params
    params.require(:sport).permit(:name)
  end
end
