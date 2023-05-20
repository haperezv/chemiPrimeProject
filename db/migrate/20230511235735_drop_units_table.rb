class DropUnitsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :units
  end
end
