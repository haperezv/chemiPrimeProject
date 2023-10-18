class RemoveSlurrieDensityToSlurries < ActiveRecord::Migration[7.0]
  def change
    remove_column :slurries, :slurrie_density, :float
  end
end
