class AddRequstsToSlurries < ActiveRecord::Migration[7.0]
  def change
    add_reference :requests, :slurrie, foreign_key: true
  end
end
