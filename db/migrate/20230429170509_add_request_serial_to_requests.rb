class AddRequestSerialToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :request_serial, :string
  end
end
