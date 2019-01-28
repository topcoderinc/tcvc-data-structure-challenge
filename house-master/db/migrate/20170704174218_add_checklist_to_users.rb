class AddChecklistToUsers < ActiveRecord::Migration
  def change
    add_column :users, :checklist, :text
  end
end
