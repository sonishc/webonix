class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.date :dead_line
      t.integer :condition
      t.integer :user_id

      t.timestamps
    end
    add_index :projects, [:user_id, :created_at]
  end
end
