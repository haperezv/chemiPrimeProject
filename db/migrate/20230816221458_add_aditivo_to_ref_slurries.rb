class AddAditivoToRefSlurries < ActiveRecord::Migration[7.0]
  def change
      add_reference :slurries, :aditivo, foreign_key: true
  end
end
