class ChangeFieldDensityInSlurrieDensities < ActiveRecord::Migration[7.0]
  def change
    rename_column :slurrie_densities, :density, :slurrie_densitie
  end
end
