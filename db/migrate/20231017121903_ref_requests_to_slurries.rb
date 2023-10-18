class RefRequestsToSlurries < ActiveRecord::Migration[7.0]
  def change
    add_reference :requests, :slurrie_densities, foreign_key: true
  end
end
