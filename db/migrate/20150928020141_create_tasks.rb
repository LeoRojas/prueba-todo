class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :text
      t.boolean :done

      t.timestamps null: false
    end
  end
end
