class RemoveFromRequests < ActiveRecord::Migration[7.0]
  def change
    remove_column :requests, :temperature_gradient, :float
    remove_column :requests, :depth_md, :float
    remove_column :requests, :depth_tvd, :float
    remove_column :requests, :psi, :float
    remove_column :requests,  :bhct, :float
    remove_column :requests, :time_mezcla, :text
  end
end
