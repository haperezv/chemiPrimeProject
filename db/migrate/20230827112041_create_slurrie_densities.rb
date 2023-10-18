class CreateSlurrieDensities < ActiveRecord::Migration[7.0]
  def change
    create_table :slurrie_densities do |t|
      t.float :density

      t.timestamps
    end
  end
end
