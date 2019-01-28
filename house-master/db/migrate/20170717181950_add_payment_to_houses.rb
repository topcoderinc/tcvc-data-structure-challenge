class AddPaymentToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :payment, :decimal
  end
end
