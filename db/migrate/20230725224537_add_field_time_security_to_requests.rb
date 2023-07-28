class AddFieldTimeSecurityToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :time_security, :date
  end
end
