class VisitorController < ApplicationController
  def index
    @training_grounds = TrainingGround.includes(:sport, :location)

    if params[:search].present?
      @training_grounds = @training_grounds.where("training_grounds.name ILIKE ? OR locations.address ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
        .joins(:location)
    end

    if params[:sport_type].present?
      @training_grounds = @training_grounds.where(sport_id: params[:sport_type])
    end

    @training_grounds = @training_grounds.page(params[:page]).per(10)
  end
end
