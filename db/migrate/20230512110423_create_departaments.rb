class CreateDepartaments < ActiveRecord::Migration[7.0]
  def change
    create_table :departaments do |t|
      t.string :departament, null: false

      t.timestamps
    end
  end
end
