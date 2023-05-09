class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :job_type
      t.date :job_time

      t.timestamps
    end
  end
end
