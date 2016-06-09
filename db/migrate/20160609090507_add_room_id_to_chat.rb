class AddRoomIdToChat < ActiveRecord::Migration
  def change
    add_column :chats, :room_id, :integer
  end
end
