class Booking < ApplicationRecord
  belongs_to :training_ground

  validates :player_name, :start_time, :end_time, presence: true
  validate :start_time_before_end_time
  validate :no_overlap

  private

  def start_time_before_end_time
    if start_time.present? && end_time.present? && start_time >= end_time
      errors.add(:start_time, "must be before end time")
    end
  end

  def no_overlap
    return unless start_time.present? && end_time.present?

    overlapping_bookings = training_ground.bookings.where.not(id: id)
                            .where("start_time < ? AND end_time > ?", end_time, start_time)
    if overlapping_bookings.exists?
      errors.add(:base, "The selected time overlaps with another booking.")
    end
  end
end
