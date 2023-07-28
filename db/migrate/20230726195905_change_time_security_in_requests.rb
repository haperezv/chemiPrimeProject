class ChangeTimeSecurityInRequests < ActiveRecord::Migration[7.0]
  def up
    change_column :requests, :time_security, :integer, using: 'extract(epoch from time_security)'
    change_column :requests, :time_pumpability, :integer, using: 'extract(epoch from time_pumpability)'
  end

  def down
    change_column :requests, :time_security, :date
    change_column :requests, :time_pumpability, :date
  end
end
