class TrainingGroundsController < ApplicationController
  def show
    @training_ground = TrainingGround.find(params[:id])
  end
end
