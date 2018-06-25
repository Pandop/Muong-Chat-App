class RemoveColumnMessageFromRoom < ActiveRecord::Migration[5.2]
  def change
    #remove_column("rooms", "message",:string)
    remove_column('rooms', 'message')
  end
end
