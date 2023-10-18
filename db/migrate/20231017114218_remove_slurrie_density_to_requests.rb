class RemoveSlurrieDensityToRequests < ActiveRecord::Migration[7.0]
  def change
    remove_column :requests, :slurrie_density, :float
  end
end
