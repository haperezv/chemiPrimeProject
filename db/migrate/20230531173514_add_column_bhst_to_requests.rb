class AddColumnBhstToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :bhst, :float, null: false
  end
end
