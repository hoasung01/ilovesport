class Admin::DashboardController < ApplicationController
  layout "admin" # Specify the 'admin' layout
  before_action :authenticate_admin!

  def index
  end
end
