class AddFieldOptionGasToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :nivel, :string
  end
end
