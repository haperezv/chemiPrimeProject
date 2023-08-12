class AddfieldToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :density, :float
    add_column :requests, :concentration, :float
    add_column :requests, :lote, :float
  end
end
