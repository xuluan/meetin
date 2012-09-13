class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.integer :member_id
      t.integer :role_id
      t.integer :meeting_id
      t.boolean :want

      t.timestamps
    end
  end
end
