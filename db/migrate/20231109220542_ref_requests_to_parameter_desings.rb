class RefRequestsToParameterDesings < ActiveRecord::Migration[7.0]
  def change
    add_reference :requests, :parameter_desings, foreign_key: true
  end
end
