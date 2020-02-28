class RemoveAcceptedFromRequests < ActiveRecord::Migration[5.2]
  def change
    remove_column :requests, :accepted, :boolean
  end
end
