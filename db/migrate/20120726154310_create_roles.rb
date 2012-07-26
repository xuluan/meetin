class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.integer :meeting_id
      t.integer :assign_id

      t.timestamps
    end
  end
end
