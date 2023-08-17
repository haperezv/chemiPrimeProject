class AddExtentToRefSlurries < ActiveRecord::Migration[7.0]
  def change
    add_reference :slurries, :extent, foreign_key: true
  end
end
