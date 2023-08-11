class SetDefaultValuesForFields < ActiveRecord::Migration[7.0]
  def change
    change_column_default :requests, :nivel_id, 0
    change_column_default :requests, :aporte_id, 0
  end
end
