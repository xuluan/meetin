class AddManagerIdToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :organizer_id, :integer

  end
end
