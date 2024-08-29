class TrainingGround < ApplicationRecord
  belongs_to :facility_owner
  belongs_to :sport
  belongs_to :location

  accepts_nested_attributes_for :location
end
