class CreateSlurries < ActiveRecord::Migration[7.0]
  def change
    create_table :slurries do |t|
      t.float :density
      t.float :concentration
      t.float :lote

      t.timestamps
    end
  end
end
