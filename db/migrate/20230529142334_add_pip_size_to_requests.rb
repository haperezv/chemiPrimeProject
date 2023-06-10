class AddPipSizeToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :pipe_size, :float, null: false
  end
end
