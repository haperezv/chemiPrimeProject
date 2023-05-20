class RemoveDensityFromJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :density, :string
  end
end
