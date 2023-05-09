class RemoveNullRequestSerialToRequests < ActiveRecord::Migration[7.0]
  def change
    change_column_null :requests, :request_serial, true
  end
end
