class AddRequestsReferens < ActiveRecord::Migration[7.0]
  def change
    add_reference :requests, :base, null: false, foreign_key: true
    add_reference :requests, :customer, null: false, foreign_key: true
    add_reference :requests, :sample, null: false, foreign_key: true
  end
end
