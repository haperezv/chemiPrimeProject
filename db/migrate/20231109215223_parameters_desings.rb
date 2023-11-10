class ParametersDesings < ActiveRecord::Migration[7.0]
  def change
    create_table :parameter_desings do |t|
      t.string :name
      t.string :application
      t.string :unit

      t.timestamps
    end
  end
end
