class DestinationDeparture
  include ActiveModel::Model
  attr_accessor :place, :address, :latitude, :longtitude, :start_date, :end_date, :image, :user_id, :spot, :location, :destination_id

  def save
    # 寄付情報を保存し、変数donationに代入する
    destination = Destination.create(place: place, address: address, image: image, latitude: latitude, longitude: longtitude, start_date: start_date, end_date: end_date, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Departure.create(spot: spot, location: location, latitude: latitude, longitude: longtitude, user_id: user_id, destination_id: destination.id)
  end
end