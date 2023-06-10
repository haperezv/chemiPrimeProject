class ChangeDateFormatInRequests < ActiveRecord::Migration[7.0]
  def up
    change_column :requests, :pipe_size, :decimal
  end

  def down
    change_column :requests, :pipe_size, :float
  end
end
