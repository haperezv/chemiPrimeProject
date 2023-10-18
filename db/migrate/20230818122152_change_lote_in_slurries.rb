class ChangeLoteInSlurries < ActiveRecord::Migration[7.0]
  def change
    change_column :slurries, :lote, :string
  end
end
