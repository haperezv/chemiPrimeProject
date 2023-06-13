class AddBhstCalculationRefToRequests < ActiveRecord::Migration[7.0]
  def change
    add_reference :requests, :bhst_calculation, null: false, foreign_key: true
  end
end
