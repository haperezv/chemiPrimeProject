class AddRequestIdToSlurries < ActiveRecord::Migration[7.0]
  def change
    add_reference :slurries, :request, null: false, foreign_key: true
  end
end
