class AddBhstCalculationToBhstCalculations < ActiveRecord::Migration[7.0]
  def change
    add_column :bhst_calculations, :bhst_calcutation, :float
  end
end
