class AddTotalPaymentsToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :bank_payment, :decimal
  end
end
