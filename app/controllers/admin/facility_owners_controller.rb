class Admin::FacilityOwnersController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!

  def index
    @facility_owners = FacilityOwner.all
  end
end
