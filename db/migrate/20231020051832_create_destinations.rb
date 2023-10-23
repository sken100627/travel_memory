class CreateDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations do |t|
      t.string :place
      t.string :address
      t.float :latitude
      t.float :longitude
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
