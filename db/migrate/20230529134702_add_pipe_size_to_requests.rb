class AddPipeSizeToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :pipe_size, :decimal, null: false, default: 0.0
  end
end
