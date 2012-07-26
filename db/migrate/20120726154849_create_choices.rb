class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :user_id
      t.integer :role_id
      t.integer :meeting_id
      t.boolean :want

      t.timestamps
    end
  end
end
