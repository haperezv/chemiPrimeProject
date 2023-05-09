class AddJobTimeToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :job_time, :date
  end
end
