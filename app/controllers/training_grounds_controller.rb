class TrainingGroundsController < ApplicationController
  def show
    @training_ground = TrainingGround.find(params[:id])
    @booking = Booking.new # Initialize a new booking object
  end
end
