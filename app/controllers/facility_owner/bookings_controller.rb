class FacilityOwner::BookingsController < ApplicationController
  layout "facility_owner"
  before_action :authenticate_facility_owner!

  def index
    # Fetch all bookings for the current facility owner's training grounds
    @bookings = Booking.joins(:training_ground).where(training_grounds: { facility_owner_id: current_facility_owner.id })

    # Optionally, you could eager load associated training grounds to avoid N+1 query issues
    @bookings = @bookings.includes(:training_ground)
  end
end
