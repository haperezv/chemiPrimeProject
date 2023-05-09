class RemoveRequestNumber < ActiveRecord::Migration[7.0]
  def change
    remove_column :requests, :request_number, :integer
  end
end
