class AddSlurrieDensityToSlurries < ActiveRecord::Migration[7.0]
  def change
    add_column :slurries, :slurrie_density, :float
  end
end
