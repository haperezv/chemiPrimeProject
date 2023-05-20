class AddValidateRequestsColumnNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :requests, :location, false
  end
end
