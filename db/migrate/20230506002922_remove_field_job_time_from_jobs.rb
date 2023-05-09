class RemoveFieldJobTimeFromJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :job_time, :date
  end
end
