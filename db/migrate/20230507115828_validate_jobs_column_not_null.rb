class ValidateJobsColumnNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column_null :jobs, :job_type, false
  end
end
