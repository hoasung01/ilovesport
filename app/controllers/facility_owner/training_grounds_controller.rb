class FacilityOwner::TrainingGroundsController < ApplicationController
  layout "facility_owner"
  before_action :authenticate_facility_owner!
  before_action :set_training_ground, only: [:show, :edit, :update, :destroy]

  def index
    @training_grounds = current_facility_owner.training_grounds.includes(:location, :sport)
  end

  def show
  end

  def new
    @training_ground = current_facility_owner.training_grounds.new
    @training_ground.build_location
  end

  def create
    @training_ground = current_facility_owner.training_grounds.new(training_ground_params)

    if @training_ground.save
      redirect_to facility_owner_training_ground_path(@training_ground), notice: 'TrainingGround was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @training_ground.update(training_ground_params)
      redirect_to facility_owner_training_ground_path(@training_ground), notice: 'TrainingGround was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @training_ground.destroy
    redirect_to facility_owner_training_grounds_path, notice: 'TrainingGround was successfully destroyed.'
  end

  private

  def set_training_ground
    @training_ground = TrainingGround.find(params[:id])
  end

  def training_ground_params
    params.require(:training_ground).permit(
      :name,
      :sport_id,
      location_attributes: [:address, :city, :country]
    )
  end
end
