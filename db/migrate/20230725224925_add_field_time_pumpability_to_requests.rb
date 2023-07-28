class AddFieldTimePumpabilityToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :time_pumpability, :date
  end
end
