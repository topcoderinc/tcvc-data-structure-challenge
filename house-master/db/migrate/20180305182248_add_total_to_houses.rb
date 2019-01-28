class AddTotalToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :total, :decimal
  end
end
