class AddManagerIdToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :manager_id, :integer

  end
end
