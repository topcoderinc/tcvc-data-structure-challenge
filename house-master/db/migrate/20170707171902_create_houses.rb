class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :address
      t.decimal :cost
      t.decimal :down_payment
      t.decimal :interest
      t.integer :period
      t.decimal :taxes

      t.timestamps null: false
    end
  end
end
