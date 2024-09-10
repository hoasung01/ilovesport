class Location < ApplicationRecord
  belongs_to :training_ground, optional: true

  # Geocode based on full address
  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_address_or_city_or_country?

  private

  # Method to combine address fields into a full address for geocoding
  def full_address
    [address, city, country].compact.join(', ')
  end

  # Check if address, city, or country has changed
  def will_save_change_to_address_or_city_or_country?
    address_changed? || city_changed? || country_changed?
  end
end
