class CreateBhstCalculations < ActiveRecord::Migration[7.0]
  def change
    create_table :bhst_calculations do |t|
      t.float :gradinet, null: false
      t.float :surface, null: false
      t.float :depth, null: false
      t.float :bhst, null: false

      t.timestamps
    end
  end
end
