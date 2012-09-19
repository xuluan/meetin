class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :member_id, null: false
      t.integer :role_id, null: false
      t.integer :meeting_id, null: false
      t.boolean :want

      t.timestamps
    end

    add_index :choices, :member_id
    add_index :choices, :role_id
    add_index :choices, :meeting_id
  end
end
