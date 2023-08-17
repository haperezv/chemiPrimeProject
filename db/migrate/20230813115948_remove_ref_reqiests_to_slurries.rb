class RemoveRefReqiestsToSlurries < ActiveRecord::Migration[7.0]
  def change
    remove_reference :requests, :slurrie, null: false, foreign_key: true
  end
end
