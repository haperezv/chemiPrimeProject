class RemoveMudWeightToRequests < ActiveRecord::Migration[7.0]
  def change
    remove_column :requests, :mud_weight, :decimal
  end
end
