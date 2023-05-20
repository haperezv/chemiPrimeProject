class CreateDensitys < ActiveRecord::Migration[7.0]
  def change
    create_table :densitys do |t|
      t.string :density, null: false

      t.timestamps
    end
  end
end
