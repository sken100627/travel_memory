class CreateDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations do |t|
      t.string :place, null: false, default: ""
      t.string :address, null: false, default: ""
      t.float :latitude
      t.float :longitude
      t.string :year, null: false, default: ""
      t.string :date, null: false, default: ""
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
