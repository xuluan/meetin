class AddIntroToMeetings < ActiveRecord::Migration
  def up 
    add_column :meetings, :intro, :string
  end
  def down
    remove_column :meetings, :intro 
  end
end
