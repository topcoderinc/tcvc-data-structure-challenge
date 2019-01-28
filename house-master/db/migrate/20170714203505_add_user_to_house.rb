class AddUserToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :user_id, :integer
    add_index :houses, :user_id
  end
end
