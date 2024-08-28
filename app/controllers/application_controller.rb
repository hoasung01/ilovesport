class ApplicationController < ActionController::Base
  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller? && resource_name == :admin
      "admin"
    elsif devise_controller? && resource_name == :facility_owner
      "facility_owner"
    else
      "application"
    end
  end
end
