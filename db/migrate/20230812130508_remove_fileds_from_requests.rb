class RemoveFiledsFromRequests < ActiveRecord::Migration[7.0]
  def change
    remove_column :requests, :density, :float
    remove_column :requests, :concentration, :float
    remove_column :requests, :lote, :float
  end
end
