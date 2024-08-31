class Admin::FacilityOwnersController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!

  def index
    @facility_owners = FacilityOwner.includes(training_grounds: :sport)
  end
end
