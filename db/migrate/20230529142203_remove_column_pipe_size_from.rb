class RemoveColumnPipeSizeFrom < ActiveRecord::Migration[7.0]
  def change
    remove_column :requests, :pipe_size, :decimal
  end
end
