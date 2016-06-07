class AddRoomIdToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :room_id, :integer
  end
end
