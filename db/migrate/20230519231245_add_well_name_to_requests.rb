class AddWellNameToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :well_name, :string, null: false
  end
end
