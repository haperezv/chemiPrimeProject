class RefParameterDesingsToRequests < ActiveRecord::Migration[7.0]
  def change
    add_reference :parameter_desings, :requests, foreign_key: true
  end
end
