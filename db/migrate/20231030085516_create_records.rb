class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.integer :gasoline_cost, null: false
      t.integer :accommondation_fee, null: false
      t.integer :express_fee, null: false
      t.integer :food_expenses, null: false
      t.references :user, foreign_key: true
      t.references :destination, foreign_key: true

      t.timestamps
    end
  end
end
