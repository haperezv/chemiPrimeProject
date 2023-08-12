class AddAditivoToRequests < ActiveRecord::Migration[7.0]
  def change
    add_reference :requests, :aditivo, foreign_key: true
  end
end
