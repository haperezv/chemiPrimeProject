class CreateBases < ActiveRecord::Migration[7.0]
  def change
    create_table :bases do |t|
      t.string :base, null: false

      t.timestamps
    end
  end
end
