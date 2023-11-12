class Destination < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :user
  has_one_attached :image
  has_one :record
  has_one :departure
end