class RemovebhstFromBhstCalculations < ActiveRecord::Migration[7.0]
  def change
    remove_column :bhst_calculations, :bhst, :float
  end
end
