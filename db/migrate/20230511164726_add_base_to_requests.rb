class AddBaseToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :base, :string, null: false
  end
end
