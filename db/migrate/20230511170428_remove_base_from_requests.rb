class RemoveBaseFromRequests < ActiveRecord::Migration[7.0]
  def change
    remove_column :requests, :base, :string
  end
end
