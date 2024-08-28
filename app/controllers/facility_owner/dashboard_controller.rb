class FacilityOwner::DashboardController < ApplicationController
  layout "facility_owner"
  before_action :authenticate_facility_owner!

  def index
  end
end
