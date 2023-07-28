class AddFieldTotailTimeToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :total_time, :integer
  end
end
