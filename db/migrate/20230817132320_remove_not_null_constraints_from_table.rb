class RemoveNotNullConstraintsFromTable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :requests, :nivel_id, true
    change_column_null :requests, :aporte_id, true
  end
end
