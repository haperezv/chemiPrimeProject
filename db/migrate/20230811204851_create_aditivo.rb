class CreateAditivo < ActiveRecord::Migration[7.0]
  def change
    create_table :aditivos do |t|
      t.string :aditivo

      t.timestamps
    end
  end
end
