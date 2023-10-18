class AddToSlurrieDensityToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :slurrie_density, :float
  end
end
