class AddHouseToUser < ActiveRecord::Migration
  def change
    add_column :users, :house_id, :integer
    add_index :users, :house_id
  end
end
