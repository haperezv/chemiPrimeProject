class CreateRequestSlurries < ActiveRecord::Migration[7.0]
  def change
    create_table :request_slurries do |t|
      t.references :request, null: false, foreign_key: true
      t.references :slurrie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
