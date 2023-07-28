class CreateNivels < ActiveRecord::Migration[7.0]
  def change
    create_table :nivels do |t|
      t.string :nivel

      t.timestamps
    end
  end
end
