class TrainingGround < ApplicationRecord
  belongs_to :facility_owner
  belongs_to :sport
  belongs_to :location

  has_many :bookings, dependent: :destroy
  accepts_nested_attributes_for :location
end
