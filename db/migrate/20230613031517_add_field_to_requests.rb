class AddFieldToRequests < ActiveRecord::Migration[7.0]
    def change
      add_column :requests, :temperature_gradient, :float, null: false
      add_column :requests, :depth_md, :float, null: false
      add_column :requests, :depth_tvd, :float, null: false
      add_column :requests, :psi, :float, null: false
      add_column :requests,  :bhct, :float, null: false
      add_column :requests, :time_mezcla, :text, null: false
    end
end
