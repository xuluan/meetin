class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :title, null: false
      t.text :agenda
      t.string :role_list
      t.string :invitation_list
      t.datetime :started_at, null: false
      t.string :location, null: false
      t.string :intro, null: false
      t.integer :organizer_id, null: false

      t.timestamps
    end
    add_index :meetings, :organizer_id
  end
end
