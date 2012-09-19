class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, null: false
      t.integer :meeting_id, null: false
      t.integer :assign_id, default: nil

      t.timestamps
    end
    add_index :roles, :meeting_id
    add_index :roles, :assign_id
  end
end
