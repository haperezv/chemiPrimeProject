class CreateAportes < ActiveRecord::Migration[7.0]
  def change
    create_table :aportes do |t|
      t.string :aporte

      t.timestamps
    end
  end
end
