class ValidateRequestsColumnNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :requests, :request_date, false
    change_column_null :requests, :request_serial, false
    change_column_null :requests, :job_time, false
  end
end
