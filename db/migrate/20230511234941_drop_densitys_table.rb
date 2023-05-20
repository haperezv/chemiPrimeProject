class DropDensitysTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :densitys
  end
end
