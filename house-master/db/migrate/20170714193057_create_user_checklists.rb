class CreateUserChecklists < ActiveRecord::Migration
  def change
    create_table :user_checklists do |t|

      t.timestamps null: false
    end
  end
end
