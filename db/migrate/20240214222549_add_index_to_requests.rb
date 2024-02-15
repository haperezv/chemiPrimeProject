class AddIndexToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :extent_id, :integer
    add_index :requests, :extent_id
  end
end
