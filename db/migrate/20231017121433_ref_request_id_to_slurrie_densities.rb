class RefRequestIdToSlurrieDensities < ActiveRecord::Migration[7.0]
  def change
    add_reference :slurrie_densities, :request, null: false, foreign_key: true
  end
end
