class CreateCasing < ActiveRecord::Migration[7.0]
  def change
    create_table :casings do |t|
      t.float :depth, null: false
      t.float :casing, null: false
      t.float :valor, null: false
    end
  end
end
