class AddExtentRefToSlurriesDensities < ActiveRecord::Migration[7.0]
  def change
    add_reference :slurrie_densities, :extent, foreign_key: true
  end
end
