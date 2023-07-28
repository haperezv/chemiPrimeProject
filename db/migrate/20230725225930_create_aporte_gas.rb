class CreateAporteGas < ActiveRecord::Migration[7.0]
  def change
    create_table :aporte_gas do |t|
      t.string :nivel

      t.timestamps
    end
  end
end
