class CreateDepartures < ActiveRecord::Migration[7.0]
  def change
    create_table :departures do |t|
      t.string :spot, null: false, default: ""
      t.string :location, null: false, default: ""
      t.float :latitude
      t.float :longitude
      t.references :user, foreign_key: true
      t.references :destination, foreign_key: true

      t.timestamps
    end
  end
end
