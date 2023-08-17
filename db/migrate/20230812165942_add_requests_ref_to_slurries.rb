class AddRequestsRefToSlurries < ActiveRecord::Migration[7.0]
  def change
    add_reference :requests, :slurrie, null: false, foreign_key: true
    
  end
end
