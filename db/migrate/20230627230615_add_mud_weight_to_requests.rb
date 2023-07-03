class AddMudWeightToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :mud_weight, :float, default: 0.0
  end
end
