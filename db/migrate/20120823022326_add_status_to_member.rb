class AddStatusToMember < ActiveRecord::Migration
  def change
    add_column :members, :status, :boolean, default: true
  end
end
