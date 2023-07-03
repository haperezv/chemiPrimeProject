class RemoveRefRequestsToSamples < ActiveRecord::Migration[7.0]
  def change
    remove_reference :requests, :sample, null: false, foreign_key: true
  end
end
