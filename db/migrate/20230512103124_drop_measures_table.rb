class DropMeasuresTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :measures
  end
end
