class RemoveRefaditivoFromRequests < ActiveRecord::Migration[7.0]
  def change
    remove_reference :requests, :aditivo, null: false, foreign_key: true
  end
end
