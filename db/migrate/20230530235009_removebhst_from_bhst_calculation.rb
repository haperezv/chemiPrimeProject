class RemovebhstFromBhstCalculation < ActiveRecord::Migration[7.0]
  def change
    remove_column :bhst_calculations, :bhst_calcutation, :float
  end
end
