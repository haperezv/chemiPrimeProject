class AddBaseToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :base, :string
  end
end
