class AddIntroToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :intro, :string

  end
end
