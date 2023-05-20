class RemoveRefExtentsToSamples < ActiveRecord::Migration[7.0]
  def change
    remove_reference :samples, :extent, null: false, foreign_key: true
  end
end
