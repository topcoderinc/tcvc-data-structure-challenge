class AddTodoListToUser < ActiveRecord::Migration
  def change
    add_column :users, :todo_list_id, :integer
    add_index :users, :todo_list_id
  end
end
