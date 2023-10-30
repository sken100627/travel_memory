class Record < ApplicationRecord
  has_one :destination
  belongs_to :user
end
