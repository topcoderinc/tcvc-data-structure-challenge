class AddHomeownersInsuranceToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :insurance, :decimal
  end
end
