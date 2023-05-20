class CreateSamples < ActiveRecord::Migration[7.0]
  def change
    create_table :samples do |t|
      t.string :sample, null: false

      t.timestamps
    end
  end
end
