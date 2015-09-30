class AddNameToUsers < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
    change_column_null :users, :name, ""
  end
  def down
    remove_column :users, :name, :string
  end
end
