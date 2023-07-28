class AddFieldTimeOperationToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :time_operation, :integer
  end
end
