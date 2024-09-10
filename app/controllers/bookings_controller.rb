class BookingsController < ApplicationController
  def create
    @training_ground = TrainingGround.find(params[:training_ground_id])
    @booking = @training_ground.bookings.build(booking_params)

    if @booking.save
      redirect_to @training_ground, notice: 'Booking created successfully.'
    else
      render 'training_grounds/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:player_name, :start_time, :end_time)
  end
end
