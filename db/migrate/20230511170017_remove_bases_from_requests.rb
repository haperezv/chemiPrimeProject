class RemoveBasesFromRequests < ActiveRecord::Migration[7.0]
  def change
    remove_reference :requests, :base, null: false, foreign_key: true
  end
end
