class RemoveFieldsFromSlurries < ActiveRecord::Migration[7.0]
  def change
    remove_column :slurries, :density, :float
  end
end
