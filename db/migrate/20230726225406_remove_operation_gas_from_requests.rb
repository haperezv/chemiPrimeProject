class RemoveOperationGasFromRequests < ActiveRecord::Migration[7.0]
  def change
    remove_column :requests, :nivel, :string
  end
end
