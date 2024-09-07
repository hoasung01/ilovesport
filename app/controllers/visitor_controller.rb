class VisitorController < ApplicationController
  def index
    @training_grounds = TrainingGround.includes(:sport, :location).all
  end
end
