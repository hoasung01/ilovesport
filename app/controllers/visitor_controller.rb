class VisitorController < ApplicationController
  def index
    @training_grounds = TrainingGround.includes(:sport, :location).page(params[:page]).per(10)
  end
end
