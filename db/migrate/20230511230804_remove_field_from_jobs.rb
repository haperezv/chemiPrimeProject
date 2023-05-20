class RemoveFieldFromJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :base, :string
    remove_column :jobs, :customer, :string
    remove_column :jobs, :sample, :string
  end
end
