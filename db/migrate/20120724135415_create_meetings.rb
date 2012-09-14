class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :title
      t.text :agenda
      t.string :role_list
      t.string :invitation_list
      t.datetime :started_at
      t.string :location

      t.timestamps
    end
  end
end
