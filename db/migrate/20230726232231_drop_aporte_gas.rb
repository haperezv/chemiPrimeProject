class DropAporteGas < ActiveRecord::Migration[7.0]
  def change
    drop_table :aporte_gas
  end
end
