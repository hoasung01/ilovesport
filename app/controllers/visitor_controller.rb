class VisitorController < ApplicationController
  def index
    @teams = Team.includes(:players) # Eager load players to avoid N+1 queries
  end
end
