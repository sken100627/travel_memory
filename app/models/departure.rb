class Departure < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  belongs_to :destination
  belongs_to :user

  
end
