class ChangeTimesMezclaInRequests < ActiveRecord::Migration[7.0]
  def up
    change_column :requests, :time_mezcla, :integer, using: 'extract(epoch from time_mezcla)'
  end

  def down
    change_column :requests, :time_mezcla, :date # Replace with the original data type of the column.
  end
end
