class AddCalculationFromCalculations < ActiveRecord::Migration[7.0]
  def change
    add_column :bhst_calculations, :calculation, :float, null: false
  end
end
