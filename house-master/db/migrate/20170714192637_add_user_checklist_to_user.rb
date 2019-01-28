class AddUserChecklistToUser < ActiveRecord::Migration
  def change
    add_column :users, :user_checklist_id, :integer
    add_index :users, :user_checklist_id
  end
end
